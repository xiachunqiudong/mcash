from enum import Enum
from typing import List, Tuple

class SignalType(Enum):
  INPUT = 0
  OUTPUT = 1
  WIRE = 2

def gen_paraller_mux(target_signal: str, src_signal_list: List[str], signal_width: int, select_one_hot: str):
  mux_codes = []

  src_signal_num = len(src_signal_list)

  for i in range(src_signal_num):
    if signal_width == 1:
      assign_expr = f"assign {target_signal}"
      select_ptr_expr = f"{select_one_hot}[{i}]"
      entry_expr = f"{src_signal_list[i]}"
    else:
      assign_expr = f"assign {target_signal}[{signal_width-1}:0]"
      select_ptr_expr = f"{{{signal_width}{{{select_one_hot}[{i}]}}}}"
      entry_expr = f"{src_signal_list[i]}[{signal_width-1}:0]"
    
    left_space = len(assign_expr) * " "

    if i == 0:
      mux_codes.append(f"{assign_expr} = {select_ptr_expr} & {entry_expr}")
    elif i != src_signal_num - 1:
      mux_codes.append(f"{left_space} | {select_ptr_expr} & {entry_expr}")
    else:
      mux_codes.append(f"{left_space} | {select_ptr_expr} & {entry_expr};")
  
  return mux_codes


class Signal:

  LEFT_ALIGN = 8
  RIGHT_ALIGN = 16

  def __init__(self, name: str, width: int, signal_type: SignalType):
    self.name = name
    self.width = width
    self.signal_type = signal_type

  def get_width_code(self) -> str:
    return "" if self.width == 1 else f"[{self.width-1}:0]"

  def get_prefix_and_align(self) -> str:
    width_code = self.get_width_code()
    left_space = " " * self.LEFT_ALIGN
    right_space = " " * (self.RIGHT_ALIGN - len(width_code))

    code = ""

    if self.signal_type is SignalType.INPUT:
      code += "  input  wire"
    elif self.signal_type is SignalType.OUTPUT:
      code += "  output wire"
    elif self.signal_type is SignalType.WIRE:
      code += "  wire"
    else:
      code += ""

    code += (left_space + width_code + f"{right_space}{self.name}")

    if self.signal_type is SignalType.WIRE:
      code += ";"

    return code

class Instance:
  
  def __init__(self, module_name: str, instance_name: str,
               port_list: List[Tuple[str, str, int]] = None,
               parameter_list: List[Tuple[str, str]] = None):

    self.module_name = module_name
    self.instance_name = instance_name
    self.port_list = port_list if port_list else []
    self.parameter_list = parameter_list if parameter_list else []

  def gen_instance(self) -> List[str]:
    instance_code_list = []
    module_code = f"  {self.module_name}" if len(self.parameter_list) == 0 else f"  {self.module_name} #("

    for parameter in self.parameter_list:
      name = parameter[0]
      parm = parameter[1]
      module_code += f".{name}({parm})"

    if len(self.parameter_list) != 0:
      module_code += ")"

    module_code += f" {self.instance_name} ("

    instance_code_list.append(module_code)

    left_align = max(len(port[0]) for port in self.port_list) + 1

    full_signal_list = []
    for port in self.port_list:
      signal_name = port[1]
      signal_width = port[2]
      if signal_width > 1:
        full_signal = f"{signal_name}[{signal_width-1}:0]"
      else:
        full_signal = signal_name
      full_signal_list.append(full_signal)
    
    right_align = max(len(full_signal) for full_signal in full_signal_list)

    for index, port in enumerate(self.port_list):
      left_space = (left_align - len(port[0])) * " "
      right_space = (right_align - len(full_signal_list[index])) * " "
      signal_name = port[1]
      signal_width = port[2]
      code = f"    .{port[0]}{left_space}({full_signal_list[index]}{right_space})"
      if index < len(self.port_list) - 1:
        code += ","
      instance_code_list.append(code)

    instance_code_list.append("  );")
    instance_code_list.append("")

    return instance_code_list


class RTL:

  def __init__(self, module_name: str, rtl_output_path: str):
    self.module_name = module_name
    self.rtl_file_path = rtl_output_path + f"/{module_name}.v"
    self.interfaces = []
    self.declarations = []
    self.logic_codes = []
    self.instances = []
    self.rtl_codes = []

  def add_interface(self, name: str, width: int, signal_type: SignalType):
    self.interfaces.append(Signal(name, width, signal_type))

  def add_declaration(self, name, width):
    self.declarations.append(Signal(name, width, SignalType.WIRE))

  def add_instance(self, module_name: str, instance_name: str,
                   port_list: List[Tuple[str, str, int]],
                   parameter_list: List[Tuple[str, str]] = None):
    self.instances.append(Instance(module_name, instance_name, port_list, parameter_list))

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

  def add_logic_codes(self, logic_codes):
    self.logic_codes = logic_codes

  def gen_instance_codes(self):
    code_list = []
    self.add_comment("Module instance")
    for instance in self.instances:
      code_list += instance.gen_instance()
    return code_list


  def gen_rtl_code(self):
    self.rtl_codes.append("// This RTL code is generate by RTL generator, please do not modify!")
    self.rtl_codes.append(f"module {self.module_name } (")
    # generate interface
    self.rtl_codes += self.gen_interface_code()
    self.rtl_codes.append(");")
    self.rtl_codes.append("")
    # generate declaration
    if len(self.declarations) != 0:
      self.rtl_codes += self.gen_declaration_code()
      self.rtl_codes.append("")
    # push logic code
    self.add_comment("LOGIC START")
    self.rtl_codes += self.logic_codes
    self.rtl_codes.append("")
    # generate instance
    self.rtl_codes += self.gen_instance_codes()
    # module end
    self.rtl_codes.append("endmodule")
    
    print(f"generate rtl success, RTL path: {self.rtl_file_path}")
    with open(self.rtl_file_path, 'w', encoding='utf-8') as file:
      file.writelines([code + '\n' for code in self.rtl_codes])
