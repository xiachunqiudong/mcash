import json
import math
from gen_verilog import *


RIGHT_ALIGN_NUM = 16

def parse_config_file(config_file: str) -> dict:
  # parse config file
  config_dict = {}
  try:
      with open(config_file, 'r') as f:
          config_dict = json.load(f)
  except FileNotFoundError:
      print(f"Error: can not find config file '{config_file}'")
  except json.JSONDecodeError as e:
      print(f"Error: wrong config file - {e}")

  return config_dict

def gen_dff_instance(signal_name, signal_width):
  code_list = []
  space_num = len(str(signal_name))
  align_content = " " * space_num
  code_list.append(f"// {signal_name.upper()} DFF: {signal_width} bits")
  code_list.append(f"  DFF #(.WIDTH({signal_width})) {signal_name}_reg (")
  code_list.append(f"  .CLK(clk{align_content}),")
  code_list.append(f"  .WEN(wen{align_content}),")
  code_list.append(f"  .D  ({signal_name}_In),")
  code_list.append(f"  .Q  ({signal_name}_Q ));")
  return code_list

def gen_entry_instance(module_name, singal_dict, index):
  code_list = []
  code_list.append(f"//{module_name} Entry {index}")
  code_list.append(f"  {module_name}_entry {module_name}_entry{index} (")

  for k, v in singal_dict:
    code_list.append(f"    .{k}_In({module_name}_entry{index}_{k}_In[{v-1}:0])")
  for k, v in singal_dict:
    code_list.append(f"    .{k}_Q({module_name}_entry{index}_{k}_Q[{v-1}:0])")
  
  code_list.append("  );")
  code_list.append("")

  return code_list

def gen_queue_entry(config_dict):
  module_name = config_dict['design'] + "_entry"
  output_path = config_dict['output_file']

  rtl = RTL(module_name, output_path)

  # add interface
  rtl.add_interface("clk", 1, SignalType.INPUT)
  rtl.add_interface("wen", 1, SignalType.INPUT)
  # input
  for signal_name, signal_width in config_dict['fields'].items():
    rtl.add_interface(signal_name + "_In", signal_width, SignalType.INPUT)
  # output
  for signal_name, signal_width in config_dict['fields'].items():
    rtl.add_interface(signal_name + "_Q", signal_width, SignalType.OUTPUT)

  logic_codes = []

  for signal_name, signal_width in config_dict['fields'].items():
    logic_codes += gen_dff_instance(signal_name, signal_width)
    logic_codes.append("")

  rtl.add_logic_codes(logic_codes)

  rtl.gen_rtl_code()


def gen_queue(config_dict):
  entry_name = config_dict['design'] + "_entry"
  module_name = config_dict['design'] + "_array"
  output_path = config_dict['output_file']
  queue_size = config_dict['size']

  rtl = RTL(module_name, output_path)

  ptr_width = int(math.log2(queue_size))

  read_data_signals = []

  # add interface
  rtl.add_interface("clk", 1, SignalType.INPUT)
  rtl.add_interface("read_ptr", ptr_width, SignalType.INPUT)
  rtl.add_interface("wen", 1, SignalType.INPUT)
  rtl.add_interface("write_ptr", ptr_width, SignalType.INPUT)
  for signal_name, signal_width in config_dict['fields'].items():
    rtl.add_interface(module_name + "_" + signal_name + "_In", signal_width, SignalType.INPUT)
  for signal_name, signal_width in config_dict['fields'].items():
    read_data_signal = module_name + "_" + signal_name
    read_data_signals.append(read_data_signal)
    rtl.add_interface(read_data_signal + "_rdata", signal_width, SignalType.OUTPUT)

  # add declaration
  max_index_width = len(str(queue_size-1))

  for signal_name, signal_width in config_dict['fields'].items():
    for i in range(queue_size):
      rtl.add_declaration(f"{entry_name}{i:0{max_index_width}d}_" + signal_name + "_Q", signal_width)

  rtl.add_declaration("read_ptr_dcd", 1 << ptr_width)

  wen_codes = []

  for i in range(queue_size):
    wen_code = f"{entry_name}_entry{i:0{max_index_width}d}_wen"
    wen_codes.append(wen_code)
    rtl.add_declaration(wen_code, 1)
  
  # add logic
  logic_codes = []
  # wen array
  for i, wen in enumerate(wen_codes):
    logic_codes.append(f"  assign {wen} = write_ptr[{ptr_width-1}:0] == {ptr_width}'d{i};")
  # read ptr dcd
  for i in range(queue_size):
    logic_codes.append(f"  assign read_ptr_dcd[{i}] = read_ptr[{ptr_width-1}:0] == {ptr_width}'d{i};")

  # read data select
  read_data_logic = []

  for read_data_signal in read_data_signals:
    for i in range(queue_size):
      if i == 0:
        read_data_logic.append(f"assign {read_data_signal}_rdata = read_ptr_dcd[{i}] & {read_data_signal.replace("array", "entry")}_entry{i:0{max_index_width}d}")
      else:
        read_data_logic.append(f"| read_ptr_dcd[{i}] & {read_data_signal}_entry{i:0{max_index_width}d}")
    
  logic_codes += read_data_logic
  

  rtl.add_logic_codes(logic_codes)

  # add instance
  for i in range(queue_size):
    ports = []
    ports.append(("clk", "clk", 1))
    ports.append(("wen", f"{entry_name}_entry{i:0{max_index_width}d}_wen", 1))
    for signal_name, signal_width in config_dict['fields'].items():
      prot_name = signal_name + "_In"
      prot_signal_name = f"{module_name}_" + prot_name
      ports.append((prot_name, prot_signal_name, signal_width))
    for signal_name, signal_width in config_dict['fields'].items():
      prot_name = signal_name + "_Q"
      prot_signal_name = f"{entry_name}{i:0{max_index_width}d}_" + prot_name
      ports.append((prot_name, prot_signal_name, signal_width))
    rtl.add_instance(entry_name, f"{entry_name}_" + f"entry{i:0{max_index_width}d}", ports)


  rtl.gen_rtl_code()





config_dict = parse_config_file('../isu_iq_define.json')

gen_queue_entry(config_dict)
gen_queue(config_dict)

