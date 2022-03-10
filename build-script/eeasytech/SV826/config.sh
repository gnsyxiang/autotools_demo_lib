#!/usr/bin/env bash

chip=SV826

product=HY-8806 HY-8806E HY-8806EV2

host=arm-linux-gnueabihf
cross_gcc_path=/opt/data/opt/toolchains/yizhi/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-

configure_param=

cppflag=-fstack-protector-all
cflag=
cxxflag=
ldflag=-rdynamic
lib=

install_path=/opt/data/office/xia/autotools_demo_lib/install
