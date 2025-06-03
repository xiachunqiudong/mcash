import sys
import random

def mcash_req_hex(tag, cache_bank, cache_set, offset, data, op):
  addr = (tag << 10) + (cache_bank << 8 )+ (cache_set << 5) + (offset << 4)
  addr_bin = "{:032b}".format(addr)
  op_bin = "{:03b}".format(op)
  data_bin = "{:0128b}".format(data)
  valid_bin = "{:01b}".format(1)
  return valid_bin + op_bin + data_bin + addr_bin

def gen_random_inst():
  tag = random.randint(0, 10000)
  cache_bank = random.randrange(0, 4)
  cache_set = random.randrange(0, 8)
  offset = random.randrange(0, 2)
  data = random.getrandbits(64)
  op = random.randrange(0, 2)
  return mcash_req_hex(tag, cache_bank, cache_set, offset, data, op)


def gen_random_inst_file(file_path, numInst):
  for i in range(3):
    # generate random inst
    insts = []
    for j in range(numInst):
      inst = gen_random_inst() + '\n'
      insts.append(inst)
    # write insts into file
    file_name = f"channe{i}.bin"
    file_full_path = file_path + '/' + file_name
    with open(file_full_path, 'w') as f:
      f.writelines(insts)

def main():
  if len(sys.argv) < 3:
    print("wrong argument number")
    return
  case_path = sys.argv[1]
  inst_num = int(sys.argv[2])
  gen_random_inst_file(case_path, inst_num)

if __name__ == "__main__":
  main()