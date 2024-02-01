#!/usr/bin/env bash

chip=esp32

product=

language=cn en

host=xtensa-esp32-elf
cross_gcc_path=/opt/toolchains/esp32/xtensa-esp32-elf/esp-2022r1-11.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-

configure_param=

cppflag=-mlongcalls -Wno-frame-address -fdiagnostics-color=always
cflag=
cxxflag=
ldflag=-rdynamic
lib=
debug=-ggdb -g -O0 -fstack-protector-all
release=-O2 -DNDEBUG

install_path=/mnt/nfs/esp32/esp32
