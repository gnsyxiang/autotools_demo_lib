#!/usr/bin/env bash

chip=rk3568

product=rock-chips

language=cn en

host=aarch64-linux-gnu
cross_gcc_path=/opt/toolchains/rock-chips/rk3568/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-

configure_param=

cppflag=-fstack-protector-all
cflag=
cxxflag=
ldflag=-rdynamic
lib=
debug=-g -O0
release=-O2 -DNDEBUG

install_path=/mnt/nfs/rock-chips/rk3568
