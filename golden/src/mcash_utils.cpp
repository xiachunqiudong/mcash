#include "svdpi.h"
#include "mcash_utils.h"

uint64_t get_bits(uint64_t data, uint16_t begin, uint16_t end) {
  uint16_t width = end - begin + 1;
  uint64_t mask = (1 << width) - 1;
  return (data >> begin) & mask;
}
