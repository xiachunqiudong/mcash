TOP ?= mcash_tb

SIM_DIR = $(shell pwd)
MCASH_HOME = $(SIM_DIR)/../..

export MCASH_HOME

FILELIST += -file $(MCASH_HOME)/synthesis/filelist.f
FILELIST += -file $(MCASH_HOME)/simulation/filelist.f

BUILD_DIR = ./build

gen_code:
	python3 $(MCASH_HOME)/simulation/src/tools/addr_gen.py > $(CASE_PATH)/$(CASE_NAME).hex

golden:
	make -C ../../golden all
 
vcs: clean
	mkdir -p $(BUILD_DIR) && \
	cd $(abspath $(BUILD_DIR)) && \
	vcs -assert svaext -full64 -timescale=1ns/1ns +lint=TFIPC-L -debug_acc+all -debug_access -sverilog \
	-kdb -lca -DVCS \
	+vcs+loopreport+10000 \
	$(FILELIST) \
	-top $(TOP) -l elab.log

sim:
	./build/simv \
	+MCASH_DUMP_LOG=$(CASE_PATH)/$(CASE_NAME).log +FSDB_FILE=$(CASE_PATH)/$(CASE_NAME) +CASE_PATH=$(CASE_PATH)

simb: vcs
	./build/simv \
	+MCASH_DUMP_LOG=$(CASE_PATH)/$(CASE_PATH).log +FSDB_FILE=$(CASE_PATH)/$(CASE_NAME) +CASE_PATH=$(CASE_PATH)

vd:
	verdi -elab ./build/simv.daidir/kdb \
	-ssf $(CASE_PATH)/$(CASE_NAME).fsdb &

clean:
	rm -rf ./build
