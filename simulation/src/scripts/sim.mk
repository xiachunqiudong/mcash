MCASH_SIM_PATH = /home/ICer/project/mcash/simulation/sim

CASE_PATH ?= /home/ICer/project/mcash_sim/case/ruike
CASE_NAME ?= ruike

build:
	make -C $(MCASH_SIM_PATH) vcs

gen_code: build
	make -C $(MCASH_SIM_PATH) gen_code \
	CASE_PATH=$(CASE_PATH) \
	CASE_NAME=$(CASE_NAME)

run: gen_code
	make -C $(MCASH_SIM_PATH) sim \
	CASE_PATH=$(CASE_PATH) \
	CASE_NAME=$(CASE_NAME)


vd:
	make -C $(MCASH_SIM_PATH) vd \
	CASE_PATH=$(CASE_PATH) \
	CASE_NAME=$(CASE_NAME)

clean:
	cd $(CASE_PATH) && rm -rf *

