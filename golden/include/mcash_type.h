#include <stdint.h>

// cross bar check
struct Mcash_req_t {
  uint8_t  valid;
  uint8_t  op;
  uint32_t addr;
  uint64_t data;
};

// isu check
struct Isu_iq_entry_t {
  bool    valid;
  uint8_t rob_id;
  uint8_t ch_id;
  uint8_t opcode;
  uint8_t need_linefill;
  uint8_t set_way_offset;
  uint8_t wbuffer_id;
  uint8_t offset0_state;
  uint8_t offset1_state;
};
