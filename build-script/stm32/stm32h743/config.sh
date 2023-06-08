#!/usr/bin/env bash

chip=stm32h743

product=stm32

language=cn en

host=arm-none-eabi
cross_gcc_path=/opt/toolchains/mcu/gcc-arm-none-eabi-6_2-2016q4/bin/arm-none-eabi-

configure_param=

cppflag=-mcpu=cortex-m7 -mthumb -mfpu=fpv5-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections
cflag=-Dgcc -std=c99
cxxflag=
ldflag=-specs=nano.specs -specs=nosys.specs -mcpu=cortex-m7 -mthumb -mfpu=fpv5-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections
lib=
debug= -O0 -gdwarf-2 -g
release=-O2

install_path=/mnt/nfs/stm32/stm32h743
