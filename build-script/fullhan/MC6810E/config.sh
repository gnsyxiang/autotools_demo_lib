#!/usr/bin/env bash

chip=MC6810E

product=HY-6810

language=cn en

host=arm-linux-gnueabihf
cross_gcc_path=/mnt/data/toolchain/fullhan/MC6810E/molchipv500-armgcc-uclibc/bin/arm-mol-linux-uclibcgnueabihf-

configure_param=

cppflag=-fstack-protector-all
cflag=
cxxflag=
ldflag=-rdynamic
lib=

install_path=/mnt/nfs/fullhan/MC6810E

