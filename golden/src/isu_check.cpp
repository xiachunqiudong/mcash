#include "mcash_type.h"
#include "mcash_para.h"
#include "mcash_utils.h"


uint8_t banks_inflight_array[BANK_SIZE][64];
uint64_t banks_linefill_data_array[BANK_SIZE][64][4];

uint8_t banks_chs_rob[BANK_SIZE][CHANNLE_SIZE];

uint16_t banks_iq_write_ptr[BANK_SIZE], banks_iq_bottom_ptr[BANK_SIZE], banks_iq_size[BANK_SIZE];

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

  uint16_t iq_write_ptr = banks_iq_write_ptr[bank];

  banks_mshr_allow_array[bank][iq_write_ptr] = !(need_linefill == 1 || golden_inflight == 1);

  banks_iq[bank][iq_write_ptr] = {true, rob_id, ch_id, opcode, need_linefill, set_way_offset, wbuffer_id, offset0_state, offset1_state};

  LOG_INFO(cycle, "[BANK %d] push htu req into iq, write_ptr: %d rob_id: %d ch_id %d opcode %d need_linefill %d set_way_offset %d wbuffer_id %d offset0_state %d offset1_state %d",
           bank, iq_write_ptr, rob_id, ch_id, opcode, need_linefill, set_way_offset, wbuffer_id, offset0_state, offset1_state);

  banks_iq_write_ptr[bank] = (banks_iq_write_ptr[bank] + 1) % ISU_IQ_SIZE;
  banks_iq_size[bank]++;

  return 0;
}

int iq_bottom_ptr_update (uint64_t cycle, uint8_t bank, uint16_t bottom_ptr) {
  bool golden_bottom_wen = banks_iq_size[bank] != 0 && !banks_iq[bank][bottom_ptr].valid;
  if (!golden_bottom_wen) {
    LOG_ERROR(cycle, "bottom ptr update fail, RTL need update but GOLDEN not!");
    return 1;
  }
  if (bottom_ptr != banks_iq_bottom_ptr[bank]) {
    LOG_ERROR(cycle, "bottom ptr check fail, GOLDEN bottom ptr %d RTL bottom ptr %d", banks_iq_bottom_ptr[bank], bottom_ptr);
    return 1;
  }
  // update golden bottom ptr
  banks_iq_bottom_ptr[bank] = (banks_iq_bottom_ptr[bank] + 1) % ISU_IQ_SIZE;
  LOG_INFO(cycle, "[BANK %d] bottom ptr update check pass, bottom ptr %d -> %d", bank, bottom_ptr, banks_iq_bottom_ptr[bank]);
  return 0;
}

uint16_t get_issue_index(uint8_t bank) {
  uint16_t issue_ptr;
  for (uint16_t i = 0; i < ISU_IQ_SIZE; i++) {
    issue_ptr = (i + banks_iq_bottom_ptr[bank]) % ISU_IQ_SIZE;
    if (banks_iq[bank][issue_ptr].valid && (banks_mshr_allow_array[bank][issue_ptr] || ((banks_iq[bank][issue_ptr].opcode >> 1) == 1)))
      return issue_ptr;
  }
  return ISU_IQ_SIZE;
}

int isu_iq_dequeue(uint64_t cycle, uint8_t bank, uint16_t issue_ptr, uint8_t ch_id, uint8_t opcode,
                   uint8_t set_way_offset, uint8_t wbuffer_id, uint8_t rob_id, uint8_t offset0_state, uint8_t offset1_state,
                   uint64_t linefill_data0, uint64_t linefill_data1, uint64_t linefill_data2, uint64_t linefill_data3) {

  uint16_t golden_issue_ptr = get_issue_index(bank);
  
  auto golden_issue_entry = banks_iq[bank][issue_ptr];

  // ptr check
  if (issue_ptr != golden_issue_ptr) {
    LOG_ERROR(cycle, "[BANK %d] iq dequeue issue ptr check fail!, GOLDEN: %d, RTL: %d", bank, golden_issue_ptr, issue_ptr);
    LOG_ERROR(cycle, "[BANK %d] GOLDEN ->  chID: %d, opcode: %d, set_way_offset: %d, wbufferID %d, robID %d, offset0State %d, offset1State %d",
              bank, golden_issue_entry.ch_id, golden_issue_entry.opcode, golden_issue_entry.set_way_offset, golden_issue_entry.wbuffer_id, golden_issue_entry.rob_id,
              golden_issue_entry.offset0_state, golden_issue_entry.offset1_state);
    LOG_ERROR(cycle, "[BANK %d] RLT    ->  chID: %d, opcode: %d, set_way_offset: %d, wbufferID %d, robID %d, offset0State %d, offset1State %d",
              bank, ch_id, opcode, set_way_offset, wbuffer_id, rob_id, offset0_state, offset1_state);
    return 1;
  }

  if (   golden_issue_entry.rob_id         != rob_id
      || golden_issue_entry.ch_id          != ch_id
      || golden_issue_entry.set_way_offset != set_way_offset
      // || golden_issue_entry.wbuffer_id     != wbuffer_id
      || golden_issue_entry.offset0_state  != offset0_state
      || golden_issue_entry.offset1_state  != offset1_state
  ) {
    return 1;
  }

  // opcode check
  uint8_t golden_htu_opcode = golden_issue_entry.opcode;
  bool golden_iq_dequeue_need_evit = (golden_htu_opcode >> 1) == 1;

  uint8_t golden_sc_opcode;

  if (golden_iq_dequeue_need_evit) {
    golden_sc_opcode = 3; // write back
  } else if (golden_issue_entry.need_linefill) {
    golden_sc_opcode = 2;
  } else if (golden_htu_opcode & 1) {
    golden_sc_opcode = 0;
  } else {
    golden_sc_opcode = 1;
  }

  if (golden_sc_opcode != opcode) {
    LOG_ERROR(cycle, "[BANK %d] isu to sc opcode check fail! GOLDEN %d but RTL %d", bank, golden_sc_opcode, opcode);
    return 1;
  }

  if (golden_iq_dequeue_need_evit) {
    banks_iq[bank][issue_ptr].opcode = banks_iq[bank][issue_ptr].opcode & 1;
  } else {
    banks_iq[bank][issue_ptr].valid = false;
  }

  // linefill data check
  uint8_t set_way = golden_issue_entry.set_way_offset >> 1;

  uint64_t issue_linefill_data0 = banks_linefill_data_array[bank][set_way][0];
  uint64_t issue_linefill_data1 = banks_linefill_data_array[bank][set_way][1];
  uint64_t issue_linefill_data2 = banks_linefill_data_array[bank][set_way][2];
  uint64_t issue_linefill_data3 = banks_linefill_data_array[bank][set_way][3];

  if (issue_linefill_data0 != linefill_data0 || issue_linefill_data1 != linefill_data1
    || issue_linefill_data2 != linefill_data2 || issue_linefill_data3 != linefill_data3) {
      LOG_ERROR(cycle, "[BANK %d] isu to sc linefill data check fail! GOLDEN %016x%016x%016x%016x but RTL %016x%016x%016x%016x", bank, 
                issue_linefill_data0, issue_linefill_data1, issue_linefill_data2, issue_linefill_data3, linefill_data0, linefill_data1, linefill_data2, linefill_data3);
      return 1;
  }



  LOG_INFO(cycle, "ISU IQ checke pass, opcode %d", opcode);

  return 0;
}

  int update_inflight_array (uint64_t cycle, uint8_t bank, uint8_t rid, uint64_t rdata0, uint64_t rdata1, uint64_t rdata2, uint64_t rdata3) {
    // update golden inflight array
    for (int i = 0; i < ISU_IQ_SIZE; i++) {
      if ((banks_iq[bank][i].set_way_offset >> 1) == rid) {
        banks_mshr_allow_array[bank][i] = 1;
      }
    }
    banks_inflight_array[bank][rid] = 1;
    // update linefill buffer
    banks_linefill_data_array[bank][rid][0] = rdata0;
    banks_linefill_data_array[bank][rid][1] = rdata1;
    banks_linefill_data_array[bank][rid][2] = rdata2;
    banks_linefill_data_array[bank][rid][3] = rdata3;
    return 0;
  }


extern "C" {
  int c_isu_iq_enqueue(uint64_t cycle, uint8_t bank, uint8_t cacheline_inflight, uint8_t need_linefill, uint8_t rob_id, uint8_t ch_id,
                   uint8_t opcode, uint8_t set_way_offset, uint8_t wbuffer_id, uint8_t offset0_state, uint8_t offset1_state) {
    return isu_iq_enqueue(cycle, bank, cacheline_inflight, need_linefill, rob_id, ch_id, opcode, set_way_offset, wbuffer_id, offset0_state, offset1_state);
  }

  int c_isu_iq_dequeue(uint64_t cycle, uint8_t bank, uint16_t issue_ptr, uint8_t ch_id, uint8_t opcode,
                    uint8_t set_way_offset, uint8_t wbuffer_id, uint8_t rob_id, uint8_t offset0_state, uint8_t offset1_state,
                    uint64_t linefill_data0, uint64_t linefill_data1, uint64_t linefill_data2, uint64_t linefill_data3) {
    return isu_iq_dequeue(cycle, bank, issue_ptr, ch_id, opcode, set_way_offset, wbuffer_id, rob_id, offset0_state, offset1_state, linefill_data0, linefill_data1, linefill_data2, linefill_data3);
  }

  int c_iq_bottom_ptr_update (uint64_t cycle, uint8_t bank, uint16_t bottom_ptr) {
    return iq_bottom_ptr_update(cycle, bank, bottom_ptr);
  }

  int c_update_inflight_array(uint64_t cycle, uint8_t bank, uint8_t rid, uint64_t rdata0, uint64_t rdata1, uint64_t rdata2, uint64_t rdata3) {
    return update_inflight_array(cycle, bank, rid, rdata0, rdata1, rdata2, rdata3);
  }

}
