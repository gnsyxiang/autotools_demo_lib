#!/usr/bin/env bash

chip=AT32F407VGT7

product=HY-8206 HY-8206E HY-8206EV2

gcc_version=gcc-arm-none-eabi-5_4-2016q3
host=arm-none-eabi
cross_gcc_path=/opt/data/opt/toolchains/gnu_arm_embedded/gcc-arm-none-eabi-5_4-2016q3/bin/arm-none-eabi-

configure_param=

cppflag=
cflag=
cxxflag=
ldflag=
lib=-specs=nano.specs -specs=nosys.specs

install_path=/opt/data/office/xia/autotools_demo_lib/install
