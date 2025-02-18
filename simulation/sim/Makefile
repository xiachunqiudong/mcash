TOP ?= top

FILE_LIST = /home/ICer/project/mcash/syn/filelist.f

BUILD_DIR = ./build

vcs:
	mkdir -p $(BUILD_DIR) && \
	cd $(abspath $(BUILD_DIR)) && \
	vcs -full64 -timescale=1ns/1ns -debug_acc+all -fsdb -kdb \
	-f $(FILE_LIST) \
	-top $(TOP)

