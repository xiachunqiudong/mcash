#include "mcash_type.h"
#include "mcash_para.h"
#include "mcash_utils.h"


uint8_t banks_inflight_array[BANK_SIZE][64];

uint8_t banks_chs_rob[BANK_SIZE][CHANNLE_SIZE];

uint16_t banks_iq_write_ptr[ISU_IQ_SIZE], banks_iq_bottom_ptr[ISU_IQ_SIZE], banks_iq_size[ISU_IQ_SIZE];

bool banks_mshr_allow_array[BANK_SIZE][ISU_IQ_SIZE];

Isu_iq_entry_t banks_iq[BANK_SIZE][ISU_IQ_SIZE];


int isu_iq_enqueue(uint64_t cycle, uint8_t bank, uint8_t cacheline_inflight, uint8_t need_linefill, uint8_t rob_id, uint8_t ch_id,
                   uint8_t opcode, uint8_t set_way_offset, uint8_t wbuffer_id, uint8_t offset0_state, uint8_t offset1_state) {

  if (banks_iq_size[bank] >= ISU_IQ_SIZE) {
    LOG_ERROR(cycle, "[BANK %d] Golden isu iq push fail!", bank);
    return 1;
  }

  int set_way = (int)(set_way_offset >> 1);

  uint8_t golden_inflight = banks_inflight_array[bank][set_way];

  // check rob id only when opcode is read.
  if ((opcode & 1) == 0) {

    uint8_t golden_rob_id = banks_chs_rob[bank][ch_id];
    banks_chs_rob[bank][ch_id] = (golden_rob_id + 1) % CH_BANK_ROB_SIZE;
    // check
    if (golden_rob_id != rob_id || golden_inflight != cacheline_inflight) {
      LOG_ERROR(cycle, "[BANK %d] isu iq enqueue check fail! GOLDEN rob id: %d inflight: %d, RTL rob id: %d inflight: %d", bank, golden_rob_id, golden_inflight, rob_id, cacheline_inflight);
      return 1;
    }
  }

  // update inflight array
  if (need_linefill == 1) {
    banks_inflight_array[bank][set_way] = 1;
  }

  banks_mshr_allow_array[bank][set_way] = !(need_linefill == 1 || golden_inflight == 1);

  banks_iq[bank][banks_iq_write_ptr[bank]] = {true, rob_id, ch_id, opcode, need_linefill, set_way_offset, wbuffer_id, offset0_state, offset1_state};

  LOG_INFO(cycle, "[BANK %d] push htu req into iq, rob_id: %d ch_id %d opcode %d need_linefill %d set_way_offset %d wbuffer_id %d offset0_state %d offset1_state %d",
                    bank, rob_id, ch_id, opcode, need_linefill, set_way_offset, wbuffer_id, offset0_state, offset1_state);

  banks_iq_write_ptr[bank] = (banks_iq_write_ptr[bank] + 1) % ISU_IQ_SIZE;
  banks_iq_size[bank]++;

  return 0;
}

extern "C" {
  int c_isu_iq_enqueue(uint64_t cycle, uint8_t bank, uint8_t cacheline_inflight, uint8_t need_linefill, uint8_t rob_id, uint8_t ch_id,
                   uint8_t opcode, uint8_t set_way_offset, uint8_t wbuffer_id, uint8_t offset0_state, uint8_t offset1_state) {
    return isu_iq_enqueue(cycle, bank, cacheline_inflight, need_linefill, rob_id, ch_id, opcode, set_way_offset, wbuffer_id, offset0_state, offset1_state);
  }
}
