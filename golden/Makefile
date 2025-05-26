
VCS_INC = /home/synopsys/vcs/O-2018.09-SP2/include
VCS_INC = /opt/Synopsys/vcs/V-2023.12-SP2/include

CXXFLAGS = -Wall -Werror -Iinclude -shared -std=c++11 -fPIC \
           -I $(VCS_INC)

SRCS := $(wildcard src/*.cpp)
OBJS := $(patsubst src/%.cpp,build/objs/%.o,$(SRCS))

TARGET = ./build/golden.so

all: $(TARGET)

$(TARGET): $(OBJS)
	g++ $(CXXFLAGS) -o $@ $^

build/objs/%.o: src/%.cpp
	mkdir -p ./build/objs
	g++ $(CXXFLAGS) -c -o $@ $<

clean:
	rm -rf ./build
