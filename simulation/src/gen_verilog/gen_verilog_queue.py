import json
import math


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
  

def gen_wire_declaration(signal_name, signal_width, space_num):
  code = ""
  align_content = " " * space_num
  if signal_width > 1:
    code = f"  wire        [{signal_width-1}:0]{align_content}{signal_name}"
  else:
    code = f"  wire        {align_content}{signal_name}"
  return code

def gen_interface(signal_name, signal_width, space_num, type):
  code = ""
  align_content = " " * space_num
  # gen input
  if type == 0:
    if signal_width > 1:
      code = f"  input  wire [{signal_width-1}:0] {align_content}{signal_name}_In,"
    else:
      code = f"  input  wire {align_content}{signal_name}_In,"
  # gen output
  else:
    if signal_width > 1:
      code = f"  output wire [{signal_width-1}:0] {align_content}{signal_name}_Q,"
    else:
      code = f"  output wire {align_content}{signal_name}_Q,"
  return code

def gen_dff_instance(signal_name, signal_width):
  code_list = []
  space_num = len(str(signal_name))
  align_content = " " * space_num
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
  design_name = config_dict['design']
  rtl_file_path = config_dict['output_file']

  code_list = []
  code_list.append(f"module {design_name}_entry (")
  code_list.append("  input  wire       clk,")
  code_list.append("  input  wire       wen,")

  max_signal_width = max(len(str(v)) for v in config_dict['fields'].values())

  # generate interface
  # generate input
  for signal_name, signal_width in config_dict['fields'].items():
    space_num = max_signal_width - len(str(signal_width))
    if signal_width == 1:
      space_num = max_signal_width + 5
    code_list.append(gen_interface(signal_name, signal_width, space_num, 0))
  # generate output
  for signal_name, signal_width in config_dict['fields'].items():
    space_num = max_signal_width - len(str(signal_width))
    if signal_width == 1:
      space_num = max_signal_width + 5
    code_list.append(gen_interface(signal_name, signal_width, space_num, 1))

  code_list[len(code_list) - 1] = code_list[len(code_list) - 1].replace(",","")
  code_list.append(");")

  # generate dff module
  for signal_name, signal_width in config_dict['fields'].items():
    code_list.append("")
    code_list.append(f"// {signal_name} dff: {signal_width} bits")
    code_list += gen_dff_instance(signal_name, signal_width)

  code_list.append("")
  code_list.append("endmodule")

  output_file_path = rtl_file_path + '/' + f"{design_name}_entry.v"
  with open(output_file_path, 'w', encoding='utf-8') as file:
      file.writelines([code + '\n' for code in code_list])


def gen_queue(config_dict):
  design_name = config_dict['design']
  queue_size = config_dict['size']
  rtl_file_path = config_dict['output_file']
  code_list = []
  max_signal_width = max(len(str(v)) for v in config_dict['fields'].values())

  code_list.append(f"module {design_name} (")

  ptr_width = int(math.log2(queue_size))

  # gen interface
  # gen input
  code_list.append("  input  wire clk,")
  code_list.append(f"  input  wire [{ptr_width-1}:0] read_ptr,")
  code_list.append(f"  input  wire [{ptr_width-1}:0] wire_ptr,")
  for signal_name, signal_width in config_dict['fields'].items():
    space_num = max_signal_width - len(str(signal_width))
    full_signal_name = f"{design_name}_{signal_name}"
    code_list.append(gen_interface(full_signal_name, signal_width, space_num, 0))
  # gen output
  for signal_name, signal_width in config_dict['fields'].items():
    space_num = max_signal_width - len(str(signal_width))
    full_signal_name = f"{design_name}_{signal_name}"
    code_list.append(gen_interface(full_signal_name, signal_width, space_num, 1))

  code_list[len(code_list) - 1] = code_list[len(code_list) - 1].replace(",","")
  code_list.append(");")
  code_list.append("")

  # gen declear
  for signal_name, signal_width in config_dict['fields'].items():
    if signal_width == 1:
      space_num = RIGHT_ALIGN_NUM - 1
    else:
      space_num = RIGHT_ALIGN_NUM - (len(str(signal_width-1)) + 5)
    for entry in range(queue_size):
      full_signal_name = f"{design_name}_entry{entry}_{signal_name}"
      code = gen_wire_declaration(full_signal_name, signal_width, space_num) + "_Q;"
      code_list.append(code)

  space_num = RIGHT_ALIGN_NUM - (len(str(queue_size-1)) + 5)
  code_list.append(f"  wire        [{queue_size-1}:0]" + " " * space_num + "array_entry_wen;")
  code_list.append("")

  # gen write logic
  for entry in range(queue_size):
      code_list.append(f"assign array_entry_wen[{entry}] = wire_ptr[{ptr_width-1}:0] == {ptr_width}'d{entry}")

  # gen entry instance
  for entry in range(queue_size):
    code_list += gen_entry_instance(design_name, config_dict['fields'].items(), entry);

  code_list.append("")
  code_list.append("endmodule")

  output_file_path = rtl_file_path + '/' + f"{design_name}_array.v"
  with open(output_file_path, 'w', encoding='utf-8') as file:
      file.writelines([code + '\n' for code in code_list])


config_dict = parse_config_file('../gen_verilog/isu_iq_define.json')

gen_queue_entry(config_dict)
gen_queue(config_dict)

