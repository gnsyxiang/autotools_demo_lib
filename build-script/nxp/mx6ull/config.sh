#!/usr/bin/env bash

chip=mx6ull

product=nxp

language=cn en

host=arm-linux-gnu
cross_gcc_path=/opt/toolchains/nxp/mx6ull/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-

configure_param=

cppflag=-fstack-protector-all
cflag=
cxxflag=
ldflag=-rdynamic
lib=
debug=-g -O0
release=-O2 -DNDEBUG

install_path=/mnt/nfs/nxp/mx6ull
