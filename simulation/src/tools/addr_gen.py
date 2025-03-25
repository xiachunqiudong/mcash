
max_offset_num = 16
max_way_num = 8



def main():
  offset = 0
  tag = 0

  #set loop
  for i in range(max_offset_num):
    # tag loop
    for j in range(max_way_num):
      addr = (tag << 10) + (offset << 4)
      addr_bin = "{:032b}".format(addr)
      op_bin = "{:03b}".format(1)
      data_bin = "{:0128b}".format(0)
      print(op_bin + data_bin + addr_bin)
      tag = tag + 1

    tag = 0
    offset = offset + 1

if __name__ == "__main__":
  main()