#include <stdint.h>

struct Mcash_req_t {
  uint8_t  valid;
  uint8_t  op;
  uint32_t addr;
  uint64_t data;
};