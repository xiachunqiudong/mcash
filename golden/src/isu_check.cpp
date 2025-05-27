#include "mcash_type.h"
#include "mcash_para.h"
#include "mcash_utils.h"


uint16_t banks_iq_write_ptr[ISU_IQ_SIZE], banks_iq_bottom_ptr[ISU_IQ_SIZE], banks_iq_size[ISU_IQ_SIZE];

Isu_iq_entry_t banks_iq[BANK_SIZE][ISU_IQ_SIZE];


int isu_iq_enqueue(uint64_t cycle, uint8_t bank, uint8_t cacheline_inflight, uint8_t need_linefill, uint8_t rob_id, uint8_t ch_id,
                   uint8_t opcode, uint8_t set_way_offset, uint8_t wbuffer_id, uint8_t offset0_state, uint8_t offset1_state) {

  if (banks_iq_size[bank] >= ISU_IQ_SIZE) {
    LOG_ERROR(cycle, "Golden isu iq push fail!");
    return 1;
  }

  banks_iq[bank][banks_iq_write_ptr[bank]] = {true, rob_id, ch_id, opcode, need_linefill, set_way_offset, wbuffer_id, offset0_state, offset1_state};

  banks_iq_write_ptr[bank] = (banks_iq_write_ptr[bank] + 1) % ISU_IQ_SIZE;

  return 0;
}

extern "C" {
  int c_isu_iq_enqueue(uint64_t cycle, uint8_t bank, uint8_t cacheline_inflight, uint8_t need_linefill, uint8_t rob_id, uint8_t ch_id,
                   uint8_t opcode, uint8_t set_way_offset, uint8_t wbuffer_id, uint8_t offset0_state, uint8_t offset1_state) {
    return isu_iq_enqueue(cycle, bank, cacheline_inflight, need_linefill, rob_id, ch_id, opcode, set_way_offset, wbuffer_id, offset0_state, offset1_state);
  }
}

