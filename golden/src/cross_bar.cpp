#include <vector>
#include <iostream>
#include "mcash_type.h"
#include "mcash_para.h"

std::vector<std::vector<Mcash_req_t>> xbar_ch_buffers(CHANNLE_SIZE);

int xbar_ch_buffers_push(uint8_t ch_id, uint8_t op, uint32_t addr, uint64_t data) {
  if (ch_id >= CHANNLE_SIZE) {
    std::cout << "bad channel id" << std::endl;
    return 1;
  }
  std::vector<Mcash_req_t>& ch_buffer = xbar_ch_buffers[ch_id];
  ch_buffer.push_back({op, addr, data});
  std::cout << "channel push success!" << std::endl;
  return 0;
}

extern "C" {

  int c_xbar_ch_buffers_push(uint8_t ch_id, uint8_t op, uint32_t addr, uint64_t data) {
    return xbar_ch_buffers_push(ch_id, op, addr, data);
  }

}




