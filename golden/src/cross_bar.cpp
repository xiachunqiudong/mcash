#include <vector>
#include <iostream>
#include "mcash_type.h"
#include "mcash_para.h"
#include "mcash_utils.h"

std::vector<std::vector<Mcash_req_t>> xbar_ch_buffers(CHANNLE_SIZE);

int xbar_ch_buffers_push(uint8_t ch_id, uint8_t op, uint32_t addr, uint64_t data) {
  if (ch_id >= CHANNLE_SIZE) {
    std::cout << "bad channel id" << std::endl;
    return 1;
  }
  std::vector<Mcash_req_t>& ch_buffer = xbar_ch_buffers[ch_id];
  ch_buffer.push_back({1, op, addr, data});
  std::cout << "channel push success!" << std::endl;
  return 0;
}

uint8_t banks_ch_rr_id[BANK_SIZE];

void bank_ch_rr(uint8_t bank_id, bool& has_req, uint8_t& ch_id, uint8_t& entry_id) {
  bool chs_has_valid_entry[CHANNLE_SIZE];
  uint8_t chs_valid_entry_id[CHANNLE_SIZE];
  // get channel want to send bank request
  for (int ch = 0; ch < CHANNLE_SIZE; ch++) {
    chs_has_valid_entry[ch] = false;
    auto ch_buffer = xbar_ch_buffers[ch];
    for (int en = 0; en < XBAR_BUFFER_SIZE; en++) {
      uint8_t ch_bank_id = (uint8_t)get_bits((uint64_t)ch_buffer[en].addr, 8, 9);
      if (ch_buffer[en].valid && ch_bank_id == bank_id) {
        chs_has_valid_entry[ch] = true;
        chs_valid_entry_id[ch] = en;
        break;
      }
    }
  }
  // bank rr
  for (int ch = 0; ch < CHANNLE_SIZE; ch++) {
    int act_ch = (banks_ch_rr_id[bank_id] + ch) % CHANNLE_SIZE;
    if (chs_has_valid_entry[act_ch]) {
      has_req = true;
      ch_id = act_ch;
      entry_id = chs_valid_entry_id[act_ch];
      xbar_ch_buffers[ch_id][entry_id].valid = false;
      banks_ch_rr_id[bank_id] = (act_ch + 1) % CHANNLE_SIZE;
      break;
    }
  }
}

int xbar_bank_htu_req_check(uint8_t bank_id, uint8_t ch_id, uint8_t entry_id, uint8_t op, uint32_t addr, uint64_t data) {
  bool bank_has_req = false;
  uint8_t bank_ch_id, bank_entry_id;
  bank_ch_rr(bank_id, bank_has_req, bank_ch_id, bank_entry_id);
  
  auto bank_req_entry = xbar_ch_buffers[bank_ch_id][bank_entry_id];
  
  if (!bank_has_req || bank_ch_id != ch_id || bank_entry_id != entry_id || bank_req_entry.op != op || bank_req_entry.addr != addr || bank_req_entry.data != data) {
    std::cout << "xbar bank req checke fail!" << std::endl;
    return 1;
  }

  std::cout << "xbar bank req checke pass!" << std::endl;

  return 0;
}


extern "C" {

  int c_xbar_ch_buffers_push(uint8_t ch_id, uint8_t op, uint32_t addr, uint64_t data) {
    return xbar_ch_buffers_push(ch_id, op, addr, data);
  }

  int c_xbar_bank_htu_req_check(uint8_t bank_id, uint8_t ch_id, uint8_t entry_id, uint8_t op, uint32_t addr, uint64_t data) {
    return xbar_bank_htu_req_check(bank_id, ch_id, entry_id, op, addr, data);
  }

}




