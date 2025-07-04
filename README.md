# mcash
## 1. Introduction

​	Mcash is a multi-port cache that supports parallel access from 3 channels and processes memory access requests through 4 banks.

![mcash_top](./images/mcash_top.png)

### 1.2 interface

#### Clock and reset interface 

| Signal Name | Bit Width | Direction | Description |
| ----------- | --------- | --------- | ----------- |
| clk_i       | 1         | input     | clock       |
| rst_i       | 1         | input     | reset       |

#### Channel interface

| Signal Name             | Bit Width | Direction | Description                  |
| ----------------------- | --------- | --------- | ---------------------------- |
| mcash_chx_req_valid_i   | 1         | input     | channelx requeset valid      |
| mcash_chx_req_allowIn_o | 1         | output    | channelx requeset allow in   |
| mcash_chx_req_op_i      | 3         | input     | channelx requeset opcode     |
| mcash_chx_req_addr_i    | 28        | input     | channelx requeset address    |
| mcash_chx_req_data_i    | 128       | input     | channelx requeset write data |
| mcash_chx_rtn_valid_o   | 1         | output    | channelx response data valid |
| mcash_chx_rtn_ready_i   | 1         | input     | channelx response data ready |
| mcash_chx_rtn_data_o    | 128       | output    | channelx response data       |

#### Bank AXI interface

| Signal Name              | Bit Width | Direction | Description                |
| ------------------------ | --------- | --------- | -------------------------- |
| bankx_biu_axi3_arvalid_o | 1         | output    | AXI3 read address valid    |
| bankx_biu_axi3_arready_i | 1         | input     | AXI3 read address ready    |
| bankx_biu_axi3_arid_o    | 6         | output    | AXI3 read address ID       |
| bankx_biu_axi3_araddr_o  | 32        | output    | AXI3 read address          |
| bankx_biu_axi3_arsize_o  | 3         | output    | AXI3 read transfer size    |
| bankx_biu_axi3_arlen_o   | 4         | output    | AXI3 read burst length     |
| bankx_biu_axi3_arburst_o | 2         | output    | AXI3 read burst type       |
| bankx_biu_axi3_rvalid_i  | 1         | input     | AXI3 read data valid       |
| bankx_biu_axi3_rready_o  | 1         | output    | AXI3 read data ready       |
| bankx_biu_axi3_rid_i     | 6         | input     | AXI3 read data ID          |
| bankx_biu_axi3_rdata_i   | 256       | input     | AXI3 read data             |
| bankx_biu_axi3_rresp_i   | 2         | input     | AXI3 read response status  |
| bankx_biu_axi3_rlast_i   | 1         | input     | AXI3 read data last beat   |
| bankx_biu_axi3_awvalid_o | 1         | output    | AXI3 write address valid   |
| bankx_biu_axi3_awready_i | 1         | input     | AXI3 write address ready   |
| bankx_biu_axi3_awid_o    | 6         | output    | AXI3 write address ID      |
| bankx_biu_axi3_awaddr_o  | 32        | output    | AXI3 write address         |
| bankx_biu_axi3_awlen_o   | 4         | output    | AXI3 write burst length    |
| bankx_biu_axi3_awsize_o  | 3         | output    | AXI3 write transfer size   |
| bankx_biu_axi3_awburst_o | 2         | output    | AXI3 write burst type      |
| bankx_biu_axi3_wvalid_o  | 1         | output    | AXI3 write data valid      |
| bankx_biu_axi3_wready_i  | 1         | input     | AXI3 write data ready      |
| bankx_biu_axi3_wid_o     | 6         | output    | AXI3 write data ID         |
| bankx_biu_axi3_wdata_o   | 256       | output    | AXI3 write data            |
| bankx_biu_axi3_wstrb_o   | 32        | output    | AXI3 write strb            |
| bankx_biu_axi3_wlast_o   | 1         | output    | AXI3 write data last beat  |
| bankx_biu_axi3_bvalid_i  | 1         | input     | AXI3 write response valid  |
| bankx_biu_axi3_bready_o  | 1         | output    | AXI3 write response ready  |
| bankx_biu_axi3_bid_i     | 6         | input     | AXI3 write response ID     |
| bankx_biu_axi3_bresp_i   | 2         | input     | AXI3 write response status |

## 2. How to run mcash

### generate random case

```shell
cd mcash/simulation/src/tools
python3 gen_rand_inst.py case/randcase/rand_10000 10000
```

> [!NOTE]
>
> This command will generate 10,000 random instructions into path `case/randcase/rand_10000` for every channel.

```shell
ls case/randcase/rand_10000
channel0.bin
channel1.bin
channel2.bin
```

### run case

build golden.so 

```shell
cd golden
make clean
make
```
build simv

```shell
cd simulation/sim
make vcs
```
run your case
```shell
cd simulation/sim
make sim CASE_PATH=xxx CASE_NAME=xxx
```
