TOP ?= top

MCASH_HOME = /home/ICer/project/mcash
export MCASH_HOME

FILE_LIST = -file $(MCASH_HOME)/synthesis/filelist.f

BUILD_DIR = ./build

vcs:
	mkdir -p $(BUILD_DIR) && \
	cd $(abspath $(BUILD_DIR)) && \
	vcs -full64 -timescale=1ns/1ns -debug_acc+all -fsdb -kdb \
	$(FILE_LIST) \
	-top $(TOP)

sim:
	./build/simv

vd:
	verdi -elab ./build/simv.daidir/kdb \
	-ssf tb.fsdb &