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
  

def gen_wire_declaration(signal_name, signal_width, left_align):
  code = ""
  align_content = " " * space_num
  if signal_width > 1:
    code = f"  wire        [{signal_width-1}:0]{align_content}{signal_name}"
  else:
    code = f"  wire        {align_content}{signal_name}"
  return code

class Signal:

  left_align = 8
  rigth_align = 16

  def __init__(self, name, width, direction):
    self.name = name
    self.width = width
    self.direction = direction

  def get_width_code(self):
    if self.width == 1:
      return ""
    else:
      return f"[{self.width}:0]"

  def get_interface(self):
    left_space = " " * self.left_align
    width_code = self.get_width_code()
    right_space = " " * (self.rigth_align - len(width_code))
    
    if self.direction == 0:
      code = f"  input{left_space} wire " + width_code + f"{right_space}{self.name}"
    else:
      code = f"  output{left_space}wire " + width_code + f"{right_space}{self.name}"

    return code

  def get_declaration(self):
    left_space = " " * self.left_align
    width_code = self.get_width_code()
    right_space = " " * (self.rigth_align - len(width_code))

    if self.direction == 0:
      code = f"  wire{left_space}" + width_code + f"{right_space}{self.name};"
    else:
      code = f"  wire{left_space}" + width_code + f"{right_space}{self.name};"

    return code


class RTL:

  def __init__(self, module_name, rtl_output_path):
    self.module_name = module_name
    self.rtl_file_path = rtl_output_path + f"/{module_name}.v"
    self.interfaces = []
    self.declarations = []
    self.rtl_codes = []

  def add_interface(self, name, width, direction):
    self.interfaces.append(Signal(name, width, direction))

  def add_declaration(self, name, width):
    self.declarations.append(Signal(name, width, 0))

  def add_comment(self, comment):
    self.rtl_codes.append("//" + ("-" * 80))
    self.rtl_codes.append("//" + (" " * 30) + comment)
    self.rtl_codes.append("//" + ("-" * 80))

  def gen_interface_code(self):
    code_list = []
    for index, interface in enumerate(self.interfaces):
      code = interface.get_interface()
      if index < len(self.interfaces) - 1:
        code += ","
      code_list.append(code)
    return code_list

  def gen_declaration_code(self):
    code_list = []
    self.add_comment("Wire declaration")
    for index, declaration in enumerate(self.declarations):
      code = declaration.get_declaration()
      code_list.append(code)
    return code_list

  def gen_rtl_code(self):
    self.rtl_codes.append("// This RTL code is generate by RTL generator, please do not modify!")
    self.rtl_codes.append(f"module {self.module_name } (")
    # generate interface
    self.rtl_codes += self.gen_interface_code()
    self.rtl_codes.append(");")
    self.rtl_codes.append("")
    # generate declaration
    self.rtl_codes += self.gen_declaration_code()
    self.rtl_codes.append("")

    self.rtl_codes.append("endmodule")
    
    print(f"generate rtl success, RTL path: {self.rtl_file_path}")
    with open(self.rtl_file_path, 'w', encoding='utf-8') as file:
      file.writelines([code + '\n' for code in self.rtl_codes])

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
  module_name = config_dict['design'] + "_entry"
  output_path = config_dict['output_file']

  rtl = RTL(module_name, output_path)

  # add interface
  rtl.add_interface("clk", 1, 0)
  rtl.add_interface("wen", 1, 0)
  # input
  for signal_name, signal_width in config_dict['fields'].items():
    rtl.add_interface(signal_name + "_In", signal_width, 0)
  # output
  for signal_name, signal_width in config_dict['fields'].items():
    rtl.add_interface(signal_name + "_Q", signal_width, 1)

  # add declaration
  for signal_name, signal_width in config_dict['fields'].items():
    rtl.add_declaration(signal_name + "_In", signal_width)
  for signal_name, signal_width in config_dict['fields'].items():
    rtl.add_declaration(signal_name + "_Q", signal_width)

  rtl.gen_rtl_code()

  # generate dff module
  # for signal_name, signal_width in config_dict['fields'].items():
  #   code_list.append("")
  #   code_list.append(f"// {signal_name} dff: {signal_width} bits")
  #   code_list += gen_dff_instance(signal_name, signal_width)


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


  # for signal_name, signal_width in config_dict['fields'].items():

  # gen declear
  for signal_name, signal_width in config_dict['fields'].items():
    if signal_width == 1:
      space_num = RIGHT_ALIGN_NUM - 1
    else:
      space_num = RIGHT_ALIGN_NUM - (len(str(signal_width-1)) + 5)
    for entry in range(queue_size):
      full_signal_name = f"{design_name}_entry{entry}_{signal_name}"
      # code = gen_wire_declaration(full_signal_name, signal_width, space_num) + "_Q;"
      # code_list.append(code)

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

