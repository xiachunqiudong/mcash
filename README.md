# mcash
a multiport cache


## How to run mcash

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
