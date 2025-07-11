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
  rtl.add_interface("rst", 1, SignalType.INPUT)
  rtl.add_interface("validate", 1, SignalType.INPUT)
  rtl.add_interface("inValidate", 1, SignalType.INPUT)
  rtl.add_interface("cacheline_inflight_In", 1, SignalType.INPUT)
  rtl.add_interface("biu_rvalid_In", 1, SignalType.INPUT)
  rtl.add_interface("biu_rid_In", 6, SignalType.INPUT)
  # input
  for signal_name, signal_width in config_dict['fields'].items():
    rtl.add_interface(signal_name + "_In", signal_width, SignalType.INPUT)
  # output
  rtl.add_interface("valid_Q", 1, SignalType.OUTPUT)
  rtl.add_interface("mshr_allow_Q", 1, SignalType.OUTPUT)
  for signal_name, signal_width in config_dict['fields'].items():
    rtl.add_interface(signal_name + "_Q", signal_width, SignalType.OUTPUT)

  rtl.add_interface("entry_req_from_ch0", 1, SignalType.OUTPUT)
  rtl.add_interface("entry_req_from_ch1", 1, SignalType.OUTPUT)
  rtl.add_interface("entry_req_from_ch2", 1, SignalType.OUTPUT)

  logic_codes = []

  # add declaration
  rtl.add_declaration("biu_id_match", 1)
  rtl.add_declaration("valid_wen", 1)
  rtl.add_declaration("valid_In", 1)
  rtl.add_declaration("mshr_allow_wen", 1)
  rtl.add_declaration("mshr_allow_In", 1)

  # add valid logic
  logic_codes.append("assign valid_In = (valid_Q & ~inValidate) | validate;")
  logic_codes.append("assign valid_wen = validate | inValidate;")
  logic_codes.append("")
  # add mshr logic
  logic_codes.append("assign mshr_allow_wen = (valid_Q & biu_id_match) | validate;")
  logic_codes.append("assign mshr_allow_In = (validate & ~(op_need_linefill_In | cacheline_inflight_In)) | (biu_id_match & valid_Q);")
  logic_codes.append("")

  logic_codes.append(f"assign biu_id_match = biu_rvalid_In & (set_way_offset_Q[6:1] == biu_rid_In[5:0]);")
  logic_codes.append("")
  logic_codes.append(f"assign entry_req_from_ch0 = ch_id_Q[1:0] == 2'd0;")
  logic_codes.append(f"assign entry_req_from_ch1 = ch_id_Q[1:0] == 2'd1;")
  logic_codes.append(f"assign entry_req_from_ch2 = ch_id_Q[1:0] == 2'd2;")
  logic_codes.append("")

  # add valid reg
  ports = []
  ports.append(("CLK", "clk", 1))
  ports.append(("RST", "rst", 1))
  ports.append(("WEN", "valid_wen", 1))
  ports.append(("D", "valid_In", 1))
  ports.append(("Q", "valid_Q", 1))
  parameter_list = []
  parameter_list.append(("WIDTH", "1"))
  rtl.add_instance("DFF_RST0", f"valid_reg", ports, parameter_list)

  # add mshr allow array
  ports = []
  ports.append(("CLK", "clk", 1))
  ports.append(("WEN", "mshr_allow_wen", 1))
  ports.append(("D", "mshr_allow_In", 1))
  ports.append(("Q", "mshr_allow_Q", 1))
  parameter_list = []
  parameter_list.append(("WIDTH", "1"))
  rtl.add_instance("DFF", f"mshr_allow_reg", ports, parameter_list)

  # add instance
  for signal_name, signal_width in config_dict['fields'].items():
    ports = []
    ports.append(("CLK", "clk", 1))
    ports.append(("WEN", "validate", 1))
    ports.append(("D", f"{signal_name}_In", signal_width))
    ports.append(("Q", f"{signal_name}_Q", signal_width))
    parameter_list = []
    parameter_list.append(("WIDTH", str(signal_width)))
    rtl.add_instance("DFF", f"{signal_name}_reg", ports, parameter_list)


  rtl.add_logic_codes(logic_codes)

  rtl.gen_rtl_code()


def gen_queue(config_dict):
  entry_name = config_dict['design'] + "_entry"
  module_name = config_dict['design'] + "_array"
  output_path = config_dict['output_file']
  queue_size = config_dict['size']

  rtl = RTL(module_name, output_path)

  ptr_width = int(math.log2(queue_size))

  # add interface
  # output
  rtl.add_interface("clk", 1, SignalType.INPUT)
  rtl.add_interface("rst", 1, SignalType.INPUT)
  rtl.add_interface("biu_rvalid_In", 1, SignalType.INPUT)
  rtl.add_interface("biu_rid_In", 6, SignalType.INPUT)
  rtl.add_interface("read_ptr", ptr_width, SignalType.INPUT)
  rtl.add_interface("validate", 1, SignalType.INPUT)
  rtl.add_interface("validate_ptr", ptr_width, SignalType.INPUT)
  rtl.add_interface("inValidate", 1, SignalType.INPUT)
  rtl.add_interface("inValidate_ptr", ptr_width, SignalType.INPUT)
  rtl.add_interface("cacheline_inflight_In", 1, SignalType.INPUT)
  for signal_name, signal_width in config_dict['fields'].items():
    rtl.add_interface(module_name + "_" + signal_name + "_In", signal_width, SignalType.INPUT)
  # output
  rtl.add_interface("iq_valid_array_Q", queue_size, SignalType.OUTPUT)
  for signal_name, signal_width in config_dict['fields'].items():
    read_data_signal = module_name + "_" + signal_name
    rtl.add_interface(read_data_signal + "_rdata", signal_width, SignalType.OUTPUT)
  rtl.add_interface(f"mshr_allow_array_Q", queue_size, SignalType.OUTPUT)
  rtl.add_interface(f"entry_req_from_ch0_array", queue_size, SignalType.OUTPUT)
  rtl.add_interface(f"entry_req_from_ch1_array", queue_size, SignalType.OUTPUT)
  rtl.add_interface(f"entry_req_from_ch2_array", queue_size, SignalType.OUTPUT)
  

  # add declaration
  max_index_width = len(str(queue_size-1))

  for signal_name, signal_width in config_dict['fields'].items():
    for i in range(queue_size):
      rtl.add_declaration(f"{entry_name}{i:0{max_index_width}d}_" + signal_name + "_Q", signal_width)

  rtl.add_declaration("read_ptr_dcd", 1 << ptr_width)

  vlidate_codes = []
  InVlidate_codes = []

  for i in range(queue_size):
    vlidate_code = f"entry{i:0{max_index_width}d}_validate"
    vlidate_codes.append(vlidate_code)
    rtl.add_declaration(vlidate_code, 1)

  for i in range(queue_size):
    InVlidate_code = f"entry{i:0{max_index_width}d}_inValidate"
    InVlidate_codes.append(InVlidate_code)
    rtl.add_declaration(InVlidate_code, 1)

  # add logic
  logic_codes = []
  # validate array
  for i, vlidate_code in enumerate(vlidate_codes):
    logic_codes.append(f"  assign {vlidate_code} = validate & validate_ptr[{ptr_width-1}:0] == {ptr_width}'d{i};")
  logic_codes.append("")
  # inValidate array
  for i, InVlidate_code in enumerate(InVlidate_codes):
    logic_codes.append(f"  assign {InVlidate_code} = inValidate & inValidate_ptr[{ptr_width-1}:0] == {ptr_width}'d{i};")
  logic_codes.append("")
  # read ptr dcd
  for i in range(queue_size):
    logic_codes.append(f"  assign read_ptr_dcd[{i}] = read_ptr[{ptr_width-1}:0] == {ptr_width}'d{i};")
  logic_codes.append("")

  # read data select
  read_data_logic = []

  for signal_name, signal_width in config_dict['fields'].items():
    left_space = ""
    for i in range(queue_size):
      if signal_width == 1:
        assign_expr = f"  assign {module_name}_{signal_name}_rdata "
        read_ptr_expr = f"read_ptr_dcd[{i}]"
        entry_expr = f"{entry_name}{i:0{max_index_width}d}_{signal_name}_Q"
      else:
        assign_expr = f"  assign {module_name}_{signal_name}_rdata[{signal_width-1}:0] "
        read_ptr_expr = f"{{{signal_width}{{read_ptr_dcd[{i}]}}}}"
        entry_expr = f"{entry_name}{i:0{max_index_width}d}_{signal_name}_Q[{signal_width-1}:0]"
      left_space = len(assign_expr) * " "

      if i == 0:        
        read_data_logic.append(assign_expr + f"= {read_ptr_expr} & {entry_expr}")
      elif i != queue_size - 1:
        read_data_logic.append(left_space + f"| {read_ptr_expr} & {entry_expr}")
      else:
        read_data_logic.append(left_space + f"| {read_ptr_expr} & {entry_expr};")
        read_data_logic.append("")

  logic_codes += read_data_logic
  

  rtl.add_logic_codes(logic_codes)

  # add instance
  for i in range(queue_size):
    ports = []
    ports.append(("clk", "clk", 1))
    ports.append(("rst", "rst", 1))
    ports.append(("validate", f"entry{i:0{max_index_width}d}_validate", 1))
    ports.append(("inValidate", f"entry{i:0{max_index_width}d}_inValidate", 1))
    ports.append(("cacheline_inflight_In", "cacheline_inflight_In", 1))
    ports.append(("biu_rvalid_In", "biu_rvalid_In", 1))
    ports.append(("biu_rid_In", "biu_rid_In", 6))
    for signal_name, signal_width in config_dict['fields'].items():
      prot_name = signal_name + "_In"
      prot_signal_name = f"{module_name}_" + prot_name
      ports.append((prot_name, prot_signal_name, signal_width))

    ports.append((f"valid_Q", f"iq_valid_array_Q[{i}]", 1))
    for signal_name, signal_width in config_dict['fields'].items():
      prot_name = signal_name + "_Q"
      prot_signal_name = f"{entry_name}{i:0{max_index_width}d}_" + prot_name
      ports.append((prot_name, prot_signal_name, signal_width))
    ports.append((f"mshr_allow_Q", f"mshr_allow_array_Q[{i}]", 1))
    ports.append((f"entry_req_from_ch0", f"entry_req_from_ch0_array[{i}]", 1))
    ports.append((f"entry_req_from_ch1", f"entry_req_from_ch1_array[{i}]", 1))
    ports.append((f"entry_req_from_ch2", f"entry_req_from_ch2_array[{i}]", 1))
    rtl.add_instance(entry_name, f"{entry_name}_" + f"entry{i:0{max_index_width}d}", ports)


  rtl.gen_rtl_code()





config_dict = parse_config_file('../isu_iq_define.json')

gen_queue_entry(config_dict)
gen_queue(config_dict)

