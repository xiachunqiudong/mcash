
max_offset_num = 2 #per
max_way_num = 8


def mcash_req_hex(tag, cache_bank, cache_set, offset, data, op):
  addr = (tag << 10) + (cache_bank << 8 )+ (cache_set << 5) + (offset << 4)
  addr_bin = "{:032b}".format(addr)
  op_bin = "{:03b}".format(op)
  data_bin = "{:0128b}".format(data)
  return op_bin + data_bin + addr_bin


def main():
  offset = 0
  tag = 0
  op = 1

  for k in range(2):
    #write and read
    offset = 0
    #set loop
    for i in range(max_offset_num):
      # tag loop
      for j in range(max_way_num):
        hex = mcash_req_hex(tag, 0, 0, offset, (i+1)*j, op)
        print(hex)
        tag = tag + 1
      tag = 0
      offset = offset + 1
    
    op = op - 1

if __name__ == "__main__":
  main()