#!/usr/bin/env bash

# set -x

if [ $# != 1 ]; then
    echo "eg: ./build.sh pc/arm"
    exit
fi

data_disk_path=/opt/data

if [ x$1 = x"pc" ]; then
    vender=pc
    gcc_version=x86_64-linux-gnu
elif [ x$1 = x"arm" ]; then
    vender=hisi
    host=arm-himix200-linux
    gcc_version=arm-himix200-linux
    gcc_prefix=arm-himix200-linux
    cross_gcc_path=${data_disk_path}/opt/toolchains/${vender}/${gcc_version}/bin/${gcc_prefix}-
elif [ x$1 = x"pwd" ]; then
    vender=pc
    gcc_version=x86_64-linux-gnu
else
    echo "eg: ./build.sh pc/arm"
fi

# 3rd_lib path
lib_3rd_path=${data_disk_path}/install/${vender}/${gcc_version}

# target
target_path=`pwd`
prefix_path=${lib_3rd_path}

cd ${target_path} && ./autogen.sh && cd -

if [ x$1 != x"pwd" ]; then
    mkdir -p _build/${vender}
    cd _build/${vender}
fi

${target_path}/configure                            \
    CC=${cross_gcc_path}gcc                         \
    CXX=${cross_gcc_path}g++                        \
    CPPFLAGS=""                                     \
    CFLAGS="-I${lib_3rd_path}/include"              \
    CXXFLAGS="-I${lib_3rd_path}/include"            \
    LDFLAGS="-L${lib_3rd_path}/lib"                 \
    LIBS=""                                         \
    PKG_CONFIG_PATH="${lib_3rd_path}/lib/pkgconfig" \
    --prefix=${prefix_path}                         \
    --build=                                        \
    --host=${host}                                  \
    --target=${host}                                \
    \


thread_jobs=`getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`

make -j${thread_jobs}; make install

