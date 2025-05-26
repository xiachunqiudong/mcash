

CXXFLAGS = -Wall -Werror -Iinclude

SRCS := $(wildcard src/*.cpp)
OBJS := $(patsubst src/%.cpp,build/objs/%.o,$(SRCS))

TARGET = ./build/mcash

all: $(TARGET)

$(TARGET): $(OBJS)
	g++ $(CXXFLAGS) -o $@ $^

build/objs/%.o: src/%.cpp
	mkdir -p ./build/objs
	g++ $(CXXFLAGS) -c -o $@ $<

clean:
	rm -rf ./build
