MCASH_SIM_PATH = /home/ICer/project/mcash/simulation/sim

CASE_PATH ?= /home/ICer/project/mcash_sim/case/random_test_100000_0
CASE_NAME ?= random_test_100000_0

golden:
	make -C $(MCASH_SIM_PATH) golden

build:
	make -C $(MCASH_SIM_PATH) vcs

run:
	make -C $(MCASH_SIM_PATH) sim \
	CASE_PATH=$(CASE_PATH) \
	CASE_NAME=$(CASE_NAME)

vd:
	make -C $(MCASH_SIM_PATH) vd \
	CASE_PATH=$(CASE_PATH) \
	CASE_NAME=$(CASE_NAME)

clean:
	cd $(CASE_PATH) && rm -rf *

