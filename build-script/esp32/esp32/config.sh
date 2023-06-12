#!/usr/bin/env bash

chip=esp32

product=esp32

language=cn en

host=xtensa-esp32-elf
cross_gcc_path=/opt/toolchains/esp32/xtensa-esp32-elf/esp-2022r1-11.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-

configure_param=

cppflag=
cflag=
cxxflag=
ldflag=
lib=
debug= -O0 -g
release=-O2

install_path=/mnt/nfs/esp32/esp32
