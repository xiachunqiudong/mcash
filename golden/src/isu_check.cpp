#include "mcash_type.h"
#include "mcash_para.h"
#include "mcash_utils.h"


uint16_t banks_iq_write_ptr[ISU_IQ_SIZE], banks_iq_bottom_ptr[ISU_IQ_SIZE], banks_iq_size[ISU_IQ_SIZE];

Isu_iq_entry_t banks_iq[BANK_SIZE][ISU_IQ_SIZE];


int isu_iq_enqueue(uint64_t cycle, uint8_t bank, uint8_t cacheline_inflight, uint8_t need_linefill, uint8_t rob_id, uint8_t ch_id,
                   uint8_t opcode, uint8_t set_way_offset, uint8_t wbuffer_id, uint8_t offset0_state, uint8_t offset1_state) {

  char msg_buf[512];

  if (banks_iq_size[bank] >= ISU_IQ_SIZE) {
    sprintf(msg_buf, "[BANK %d] Golden isu iq push fail!", bank);
    LOG_ERROR(cycle, msg_buf);
    return 1;
  }

  banks_iq[bank][banks_iq_write_ptr[bank]] = {true, rob_id, ch_id, opcode, need_linefill, set_way_offset, wbuffer_id, offset0_state, offset1_state};

  sprintf(msg_buf, "[BANK %d] push htu req into iq, rob_id: %d ch_id %d opcode %d need_linefill %d set_way_offset %d wbuffer_id %d offset0_state %d offset1_state %d",
                    bank, rob_id, ch_id, opcode, need_linefill, set_way_offset, wbuffer_id, offset0_state, offset1_state);
  LOG_INFO(cycle, msg_buf);

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

