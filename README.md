# mcash
## 1. Introduction

​	Mcash is a multi-port cache that supports parallel access from 3 channels and processes memory access requests through 4 banks.

![mcash_top](./images/mcash_top.png)


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
