#include <vector>
#include <iostream>
#include "mcash_type.h"
#include "mcash_para.h"
#include "mcash_utils.h"

uint8_t read_ptr, write_ptr, buffer_size[CHANNLE_SIZE];
Mcash_req_t xbar_ch_buffers[CHANNLE_SIZE][XBAR_BUFFER_SIZE];


int xbar_ch_buffers_push(uint64_t cycle, uint8_t ch_id, uint8_t op, uint32_t addr, uint64_t data) {
  if (ch_id >= CHANNLE_SIZE) {
    std::cout << "bad channel id" << std::endl;
    return 1;
  }
  Mcash_req_t* ch_buffer = xbar_ch_buffers[ch_id];
  if (buffer_size[ch_id] >= XBAR_BUFFER_SIZE) {
    std::cout << "xbar buffer is full, can not push!" << std::endl;
    return 1;
  }
  
  ch_buffer[write_ptr] = {1, op, addr, data};
  printf("%ld | channel[%d] buffer push success, op: %d, addr: 0x%x, data: 0x%lx\n", cycle, ch_id, ch_buffer[write_ptr].op, ch_buffer[write_ptr].addr, ch_buffer[write_ptr].data);
  buffer_size[ch_id] = buffer_size[ch_id] + 1;
  write_ptr = (write_ptr + 1) % XBAR_BUFFER_SIZE;

  return 0;
}

uint8_t banks_ch_rr_id[BANK_SIZE];

void bank_ch_rr(uint8_t bank_id, bool& has_req, uint8_t& ch_id, uint8_t& entry_id) {
  bool chs_has_valid_entry[CHANNLE_SIZE];
  uint8_t chs_valid_entry_id[CHANNLE_SIZE];

  // get channel want to send bank request
  for (int ch = 0; ch < CHANNLE_SIZE; ch++) {
    chs_has_valid_entry[ch] = false;
    chs_valid_entry_id[ch] = 0;
    Mcash_req_t* ch_buffer = xbar_ch_buffers[ch];
    for (int en = 0; en < XBAR_BUFFER_SIZE; en++) {
      int act_en = (en + read_ptr) % XBAR_BUFFER_SIZE;
      uint8_t ch_bank_id = (uint8_t)get_bits((uint64_t)ch_buffer[act_en].addr, 8, 9);
      if (ch_buffer[act_en].valid && ch_bank_id == bank_id) {
        chs_has_valid_entry[ch] = true;
        chs_valid_entry_id[ch] = act_en;
        break;
      }
    }
  }

  // for (int ch = 0; ch < CHANNLE_SIZE; ch++) {
  //   printf("ch: %d, has_valid_entry: %d, valid_entry_id: %d\n", ch, chs_has_valid_entry[ch], chs_valid_entry_id[ch]);
  // }

  // bank rr
  for (int ch = 0; ch < CHANNLE_SIZE; ch++) {
    int act_ch = (banks_ch_rr_id[bank_id] + ch) % CHANNLE_SIZE;
    if (chs_has_valid_entry[act_ch]) {
      has_req = true;
      ch_id = act_ch;
      entry_id = chs_valid_entry_id[act_ch];
      // printf("act_ch:%d ch id:%d, entryid:%d",act_ch,  ch_id, entry_id);
      xbar_ch_buffers[ch_id][entry_id].valid = false;
      banks_ch_rr_id[bank_id] = (act_ch + 1) % CHANNLE_SIZE;
      break;
    }
  }

  for (int ch = 0; ch < CHANNLE_SIZE; ch++) {
    Mcash_req_t* ch_buffer = xbar_ch_buffers[ch];
    if (ch_buffer[read_ptr].valid == 0 && buffer_size[ch] != 0) {
      read_ptr = (read_ptr + 1) % XBAR_BUFFER_SIZE;
      buffer_size[ch]--;
    }
  }


}

int xbar_bank_htu_req_check(uint64_t cycle, uint8_t bank_id, uint8_t ch_id, uint8_t entry_id, uint8_t op, uint32_t addr, uint64_t data) {
  bool bank_has_req = false;
  uint8_t bank_ch_id, bank_entry_id;
  bank_ch_rr(bank_id, bank_has_req, bank_ch_id, bank_entry_id);

  auto bank_req_entry = xbar_ch_buffers[bank_ch_id][bank_entry_id];
  
  if (!bank_has_req || bank_ch_id != ch_id || bank_entry_id != entry_id || bank_req_entry.op != op || bank_req_entry.addr != addr || bank_req_entry.data != data) {
    printf("%ld | GOLDEN: bank_has_req: %d, ch_id: %d, bank_entry_id: %d, op: %d, addr: 0x%x, data: 0x%lx\n",cycle, bank_has_req, bank_ch_id, bank_entry_id, bank_req_entry.op, bank_req_entry.addr, bank_req_entry.data);
    printf("%ld | RTL:    bank_has_req: 1, ch_id: %d, bank_entry_id: %d, op: %d, addr: 0x%x, data: 0x%lx\n",cycle, ch_id, entry_id, op, addr, data);
    std::cout << "xbar bank req checke fail!" << std::endl;
    return 1;
  }

  printf("%ld | xbar_htu_req check pass: bank_has_req: 1, ch_id: %d, bank_entry_id: %d, op: %d, addr: 0x%x, data: 0x%lx\n",cycle, ch_id, entry_id, op, addr, data);

  return 0;
}


extern "C" {

  int c_xbar_ch_buffers_push(uint64_t cycle, uint8_t ch_id, uint8_t op, uint32_t addr, uint64_t data) {
    return xbar_ch_buffers_push(cycle, ch_id, op, addr, data);
  }

  int c_xbar_bank_htu_req_check(uint64_t cycle, uint8_t bank_id, uint8_t ch_id, uint8_t entry_id, uint8_t op, uint32_t addr, uint64_t data) {
    return xbar_bank_htu_req_check(cycle, bank_id, ch_id, entry_id, op, addr, data);
  }

}




