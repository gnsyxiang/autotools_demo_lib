#!/usr/bin/env bash

chip=windows

product=HY-pc

language=cn en

host=
cross_gcc_path=

configure_param=

cppflag=-fstack-protector-all
cflag=
cxxflag=
ldflag=
lib=
debug=-g -O0
release=-O2 -DNDEBUG

install_path=/mnt/nfs/pc/windows
