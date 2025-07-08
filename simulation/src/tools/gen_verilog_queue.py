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
  

def gen_wire_declaration(signal_name, signal_width):
  if signal_width > 1:
    print(f"wire [{signal_width-1}:0] {signal_name};")
  else:
    print(f"wire {signal_name};")


config_dict = parse_config_file('isu_iq_define.json')

for signal_name, signal_width in config_dict['fields'].items():
  gen_wire_declaration(signal_name, int(signal_width))


