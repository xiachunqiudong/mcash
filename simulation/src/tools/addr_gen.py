
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
      print("{:08x}".format(addr))
      tag = tag + 1
    
    tag = 0
    offset = offset + 1

if __name__ == "__main__":
  main()