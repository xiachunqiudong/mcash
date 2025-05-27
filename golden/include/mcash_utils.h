#include <stdint.h>
#include <string>

enum class LogLevel {
  DEBUG,
  INFO,
  ERROR
};

uint64_t get_bits(uint64_t data, uint16_t begin, uint16_t end);

void logMessage(uint64_t cycle, LogLevel level, const char* file, const char* function, const char* message);

#define LOG_INFO(cycle, msg) logMessage(cycle, LogLevel::INFO, __FILE__, __FUNCTION__, msg)
#define LOG_DEBUG(cycle, msg) logMessage(cycle, LogLevel::DEBUG, __FILE__, __FUNCTION__, msg)
#define LOG_ERROR(cycle, msg) logMessage(cycle, LogLevel::ERROR, __FILE__, __FUNCTION__, msg)
