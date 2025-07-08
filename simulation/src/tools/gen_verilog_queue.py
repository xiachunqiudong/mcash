import json

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
    code = f"wire [{signal_width-1}:0] {align_content}{signal_name};"
  else:
    code = f"wire {align_content}{signal_name};"
  return code

def gen_interface(signal_name, signal_width, space_num, type):
  code = ""
  align_content = " " * space_num
  # gen input
  if type == 0:
    if signal_width > 1:
      code = f"input  wire [{signal_width-1}:0] {align_content}{signal_name}_In,"
    else:
      code = f"input  wire {align_content}{signal_name}_In,"
  # gen output
  else:
    if signal_width > 1:
      code = f"output wire [{signal_width-1}:0] {align_content}{signal_name}_Q,"
    else:
      code = f"output wire {align_content}{signal_name}_Q,"
  return code

config_dict = parse_config_file('isu_iq_define.json')

code_list = []

max_signal_width = max(len(str(v)) for v in config_dict['fields'].values())

def gen_dff_instance(signal_name, signal_width):
  code_list = []
  space_num = len(str(signal_name))
  align_content = " " * space_num
  code_list.append(f"DFF #(.WIDTH({signal_width})) {signal_name}_reg (")
  code_list.append(f".CLK(clk{align_content}),")
  code_list.append(f".WEN(wen{align_content}),")
  code_list.append(f".D  ({signal_name}_In),")
  code_list.append(f".Q  ({signal_name}_Q ));")
  return code_list

# generate interface
for signal_name, signal_width in config_dict['fields'].items():
  space_num = max_signal_width - len(str(signal_width))
  if signal_width == 1:
    space_num = max_signal_width + 5
  code_list.append(gen_interface(signal_name, signal_width, space_num, 0))

for signal_name, signal_width in config_dict['fields'].items():
  space_num = max_signal_width - len(str(signal_width))
  if signal_width == 1:
    space_num = max_signal_width + 5
  code_list.append(gen_interface(signal_name, signal_width, space_num, 1))

# generate dff module
for signal_name, signal_width in config_dict['fields'].items():
  code_list.append("")
  code_list.append(f"// {signal_name} dff: {signal_width} bits")
  code_list += gen_dff_instance(signal_name, signal_width)


for code in code_list:
  print(code)

