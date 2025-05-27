#include "svdpi.h"
#include "mcash_utils.h"
#include <iostream>
#include <sstream>

uint64_t get_bits(uint64_t data, uint16_t begin, uint16_t end) {
  uint16_t width = end - begin + 1;
  uint64_t mask = (1 << width) - 1;
  return (data >> begin) & mask;
}

const std::string COLOR_RESET = "\033[0m";
const std::string COLOR_RED = "\033[31m";
const std::string COLOR_GREEN = "\033[32m";
const std::string COLOR_YELLOW = "\033[33m";
const std::string COLOR_BLUE = "\033[34m";
const std::string COLOR_MAGENTA = "\033[35m";

std::string get_log_level_string(LogLevel level) {
    switch(level) {
        case LogLevel::DEBUG: return "DEBUG";
        case LogLevel::INFO:  return "INFO";
        case LogLevel::ERROR: return "ERROR";
        default: return "UNKNOWN";
    }
}

std::string get_color_by_log_level(LogLevel level) {
    switch(level) {
        case LogLevel::DEBUG: return COLOR_BLUE;
        case LogLevel::INFO:  return COLOR_GREEN;
        case LogLevel::ERROR: return COLOR_RED;
        default: return COLOR_RESET;
    }
}

void logMessage(uint64_t cycle, LogLevel level, const char* file, const char* function, const char* message) {

    std::string levelStr = get_log_level_string(level);
    std::string color = get_color_by_log_level(level);
    std::ostringstream oss;

    oss << color << cycle << " | [" << levelStr << "] [" << file << ">" << function << "] " << message << COLOR_RESET << std::endl;

    std::cerr << oss.str();
}

