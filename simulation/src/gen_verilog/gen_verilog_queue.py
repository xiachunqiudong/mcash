import json
import math
from enum import Enum

class SignalType(Enum):
  INPUT = 0
  OUTPUT = 1
  WIRE = 2

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

class Signal:

  LEFT_ALIGN = 8
  RIGHT_ALIGN = 16

  def __init__(self, name: str, width: int, signal_type: SignalType):
    self.name = name
    self.width = width
    self.signal_type = signal_type

  def get_width_code(self) -> str:
    return "" if self.width == 1 else f"[{self.width}:0]"

  def get_prefix_and_align(self) -> str:
    width_code = self.get_width_code()
    left_space = " " * self.LEFT_ALIGN
    right_space = " " * (self.RIGHT_ALIGN - len(width_code))

    if self.signal_type is SignalType.INPUT:
      prefix = "  input  wire"
    elif self.signal_type is SignalType.OUTPUT:
      prefix = "  output wire"
    elif self.signal_type is SignalType.WIRE:
      prefix = "  wire"
    else:
      prefix = ""

    prefix += left_space

    return prefix + width_code + f"{right_space}{self.name}"

class RTL:

  def __init__(self, module_name, rtl_output_path):
    self.module_name = module_name
    self.rtl_file_path = rtl_output_path + f"/{module_name}.v"
    self.interfaces = []
    self.declarations = []
    self.rtl_codes = []

  def add_interface(self, name: str, width: int, signal_type: SignalType):
    self.interfaces.append(Signal(name, width, signal_type))

  def add_declaration(self, name, width):
    self.declarations.append(Signal(name, width, SignalType.WIRE))

  def add_comment(self, comment):
    self.rtl_codes.append("//" + ("-" * 80))
    self.rtl_codes.append("//" + (" " * 30) + comment)
    self.rtl_codes.append("//" + ("-" * 80))

  def gen_interface_code(self):
    code_list = []
    for index, interface in enumerate(self.interfaces):
      code = interface.get_prefix_and_align()
      if index < len(self.interfaces) - 1:
        code += ","
      code_list.append(code)
    return code_list

  def gen_declaration_code(self):
    code_list = []
    self.add_comment("Wire declaration")
    for index, declaration in enumerate(self.declarations):
      code = declaration.get_prefix_and_align()
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
  rtl.add_interface("clk", 1, SignalType.INPUT)
  rtl.add_interface("wen", 1, SignalType.INPUT)
  # input
  for signal_name, signal_width in config_dict['fields'].items():
    rtl.add_interface(signal_name + "_In", signal_width, SignalType.INPUT)
  # output
  for signal_name, signal_width in config_dict['fields'].items():
    rtl.add_interface(signal_name + "_Q", signal_width, SignalType.OUTPUT)

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
  module_name = config_dict['design'] + "_array"
  output_path = config_dict['output_file']
  queue_size = config_dict['size']

  rtl = RTL(module_name, output_path)

  ptr_width = int(math.log2(queue_size))

  # add interface
  rtl.add_interface("clk", 1, 0)
  rtl.add_interface("read_ptr", ptr_width, 0)
  rtl.add_interface("wen", 1, 0)
  rtl.add_interface("write_ptr", ptr_width, 0)
  for signal_name, signal_width in config_dict['fields'].items():
    rtl.add_interface(module_name + signal_name + "_In", signal_width, 0)
  for signal_name, signal_width in config_dict['fields'].items():
    rtl.add_interface(module_name + signal_name + "_Q", signal_width, 1)

  max_index_width = len(str(queue_size-1))

  for signal_name, signal_width in config_dict['fields'].items():
    for i in range(queue_size):
      rtl.add_declaration(f"entry{i:0{max_index_width}d}_" + signal_name, signal_width)

  # rtl.gen_rtl_code()


  # gen write logic
  # for entry in range(queue_size):
  #     code_list.append(f"assign array_entry_wen[{entry}] = wire_ptr[{ptr_width-1}:0] == {ptr_width}'d{entry}")

  # gen entry instance
  # for entry in range(queue_size):
  #   code_list += gen_entry_instance(design_name, config_dict['fields'].items(), entry)




config_dict = parse_config_file('../gen_verilog/isu_iq_define.json')

gen_queue_entry(config_dict)
gen_queue(config_dict)

