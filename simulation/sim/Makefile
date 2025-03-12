TOP ?= mcash_tb

MCASH_HOME = /home/ICer/project/mcash
export MCASH_HOME

ifeq ($(TOP), arbiter_tb)
FILELIST = -file $(MCASH_HOME)/simulation/src/filelist/arbiter.f
else
FILELIST = -file $(MCASH_HOME)/synthesis/filelist.f
endif

BUILD_DIR = ./build

vcs:
	mkdir -p $(BUILD_DIR) && \
	cd $(abspath $(BUILD_DIR)) && \
	vcs -full64 -timescale=1ns/1ns -debug_acc+all -fsdb -kdb -sverilog \
	$(FILELIST) \
	-top $(TOP)

sim:
	./build/simv \
	+MCASH_DUMP_LOG=$(MCASH_DUMP_LOG)

simb: vcs
	./build/simv

vd:
	verdi -elab ./build/simv.daidir/kdb \
	-ssf $(TOP).fsdb &
