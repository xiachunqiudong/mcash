TOP ?= mcash_tb

SIM_DIR = $(shell pwd)
MCASH_HOME = $(SIM_DIR)/../..

export MCASH_HOME

ifeq ($(TOP), arbiter_tb)
FILELIST = -file $(MCASH_HOME)/simulation/src/filelist/arbiter.f
else
FILELIST = -file $(MCASH_HOME)/synthesis/filelist.f
endif

BUILD_DIR = ./build

gen_code:
	python3 $(MCASH_HOME)/simulation/src/tools/addr_gen.py > $(CASE_PATH)/$(CASE_NAME).hex

vcs:
	mkdir -p $(BUILD_DIR) && \
	cd $(abspath $(BUILD_DIR)) && \
	vcs -full64 -timescale=1ns/1ns +lint=TFIPC-L -debug_acc+all -debug_access -sverilog \
	-kdb -lca \
	+vcs+loopreport+10000 \
	$(FILELIST) \
	-top $(TOP) -l elab.log

sim:
	./build/simv \
	+MCASH_DUMP_LOG=$(CASE_PATH)/$(CASE_NAME).log +FSDB_FILE=$(CASE_PATH)/$(CASE_NAME) +CODE_FILE=$(CASE_PATH)/$(CASE_NAME).hex

simb: vcs
	./build/simv \
	+MCASH_DUMP_LOG=$(CASE_PATH)/$(CASE_NAME).log +FSDB_FILE=$(CASE_PATH)/$(CASE_NAME) +CODE_FILE=$(CASE_PATH)/$(CASE_NAME).hex

vd:
	verdi -elab ./build/simv.daidir/kdb \
	-ssf $(CASE_PATH)/$(CASE_NAME).fsdb &
