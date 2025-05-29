#include <stdint.h>
#include <stdarg.h>
#include <string>

enum class LogLevel {
  DEBUG,
  INFO,
  ERROR
};

uint64_t get_bits(uint64_t data, uint16_t begin, uint16_t end);

void log_message(uint64_t cycle, LogLevel level, const char* file, const char* function, const char* format, ...);

#define LOG_INFO(cycle, fmt, ...) log_message(cycle, LogLevel::INFO, __FILE__, __FUNCTION__, fmt, ##__VA_ARGS__)
#define LOG_DEBUG(cycle, fmt, ...) log_message(cycle, LogLevel::DEBUG, __FILE__, __FUNCTION__, fmt, ##__VA_ARGS__)
#define LOG_ERROR(cycle, fmt, ...) log_message(cycle, LogLevel::ERROR, __FILE__, __FUNCTION__, fmt, ##__VA_ARGS__)
