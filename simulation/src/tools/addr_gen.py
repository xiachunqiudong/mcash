
max_offset_num = 2 #per
max_way_num = 8


def mcash_req_hex(tag, cache_bank, cache_set, offset, data, op):
  addr = (tag << 10) + (cache_bank << 8 )+ (cache_set << 5) + (offset << 4)
  addr_bin = "{:032b}".format(addr)
  op_bin = "{:03b}".format(op)
  data_bin = "{:0128b}".format(data)
  valid_bin = "{:01b}".format(1)
  return valid_bin + op_bin + data_bin + addr_bin


def write_with_evit():
  tag = 0
  cnt = 0

  for i in range(8):
    hex = mcash_req_hex(tag, 0, 0, 0, i + 1, 1)
    print(hex)
    tag += 1
    cnt += 1

  for i in range(8):
    hex = mcash_req_hex(tag, 0, 0, 0, i + 1, 1)
    print(hex)
    tag += 1
    cnt += 1

  tag = 0
  for i in range(8):
    hex = mcash_req_hex(tag, 0, 0, 0, i + 1, 0)
    print(hex)
    tag += 1
    cnt += 1

  while(cnt <= 100):
    cnt += 1
    print("{:0164b}".format(0))

def read_after_write():
  offset = 0
  tag = 0
  op = 1
  data = 0

  for k in range(2):
    #write and read
    offset = 0
    #set loop
    for i in range(max_offset_num):
      # tag loop
      for j in range(max_way_num):
        hex = mcash_req_hex(tag, 0, 0, offset, data, op)
        print(hex)
        data = data + 1
        tag = tag + 1
      tag = 0
      offset = offset + 1
    
    op = op - 1

def main():
  write_with_evit()

if __name__ == "__main__":
  main()