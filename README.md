# README

<!-- vim-markdown-toc GFM -->

- [依赖](#依赖)
  - [autotools](#autotools)
  - [java](#java)
  - [doxygen](#doxygen)
  - [graphviz](#graphviz)
- [目录说明](#目录说明)
  - [目录](#目录)
  - [配置脚本](#配置脚本)
- [使用说明](#使用说明)
  - [配置](#配置)
- [增加新平台](#增加新平台)
  - [增加配置脚本](#增加配置脚本)
  - [增加`Makefile.am`](#增加makefileam)
  - [配置`configure.ac`](#配置configureac)
  - [修改`m4/select_vender.m4`](#修改m4select_venderm4)
  - [修改`m4/select_chip.m4`](#修改m4select_chipm4)
- [thanks](#thanks)

<!-- vim-markdown-toc -->

## 依赖

* `autotools`
* `java`
* `doxygen`
* `graphviz`

### autotools

需要安装autotools工具 (`sudo apt install -y autoconf automake`)

### java

因为使用了`*.plantuml`脚本开发相关时序图，该脚本转化为svg图片的过程中需要用到java开发环境

### doxygen

如果需要生成html文档，需要安装doxygen软件，把相关注释转化成文档 (`sudo apt install -y doxygen`)

### graphviz

如果需要生成html文档中的调用图，需要安装graphviz软件，把函数调用通过图形的方式展示出来，并可以通过图形跳转 (`sudo apt install -y graphviz`)

## 目录说明

### 目录

```shell
.
├── autogen.sh
├── autotools_demo_lib.pc.in
├── build-script                    # 配置厂商，芯片，产品，语言等相关信息
│   ├── arterytek
│   │   ├── at32f4xx
│   │   │   ├── config.sh           # 配置脚本
│   │   │   └── Makefile.am
│   │   └── Makefile.am
│   ├── eeasytech
│   │   ├── Makefile.am
│   │   └── SV823
│   │       ├── config.sh
│   │       └── Makefile.am
│   ├── fullhan
│   │   ├── Makefile.am
│   │   └── MC6810E
│   │       ├── config.sh
│   │       └── Makefile.am
│   ├── Makefile.am
│   └── pc
│       ├── Makefile.am
│       └── pc-chip
│           ├── config.sh
│           └── Makefile.am
├── build.sh                        # 编译脚本
├── config.h.in
├── configure.ac
├── doc
│   └── Makefile.am
├── example                         # 测试demo
│   ├── hy_calc_demo.c
│   └── Makefile.am
├── include                         # 头文件
│   ├── hy_calc.h
│   ├── hy_module.h
│   └── Makefile.am
├── LICENSE
├── m4
│   ├── ax_prog_doxygen.m4
│   ├── check_doxygen.m4
│   ├── check_java.m4
│   ├── check_libcunit.m4
│   ├── pkg.m4
│   ├── select_chip.m4
│   ├── select_language.m4
│   ├── select_product.m4
│   └── select_vender.m4
├── Makefile.am
├── README.md
├── res                             # 资源文件
│   ├── Doxyfile
│   ├── doxygen.am
│   ├── get_project_info.sh
│   ├── Makefile.am
│   └── voice                       # 多国语言
│       ├── cn
│       │   ├── demo.pcm
│       │   └── Makefile.am
│       ├── en
│       │   ├── demo.pcm
│       │   └── Makefile.am
│       └── Makefile.am
├── src                             # 源文件
│   ├── hy_calc.c
│   ├── hy_module.c
│   └── Makefile.am
└── test                            # 单元测试
    ├── hy_calc_test.c
    ├── hy_module_test.c
    ├── main.c
    └── Makefile.am
```


### 配置脚本

```shell
#!/usr/bin/env bash

chip=pc-chip                        # 芯片型号

product=HY-pc                       # 支持产品

language=cn en                      # 支持语言

host=
cross_gcc_path=                     # gcc路劲

configure_param=                    # configure配置参数

cppflag=-fstack-protector-all
cflag=
cxxflag=
ldflag=-rdynamic
lib=

install_path=                       # 安装路径
```

## 使用说明

### 配置

* 执行`./build.sh`，生成`configure`脚本

```shell
$ ./build.sh
support vender:                 # 选择厂商
    pc
    arterytek
    eeasytech
    fullhan
please select vender: pc
support chip:                   # 选择芯片
    pc-chip
please select chip: pc-chip
support language:               # 选择语言
    cn
    en
please select language: en
support build version:          # 选择是否调试版本
    release
    debug
please select build version: debug
```

* 三部曲编译源码并生成对应文件

```shell
$ ./configure
$ make
$ make install
```

## 增加新平台

增加`xxx_vender`下的`xxx_chip`平台

### 增加配置脚本

* 新建`config.sh`

```shell
$ mkdir -p build-script/xxx_vender/xxx_chip
$ cd build-script/xxx_vender/xxx_chip
$ touch config.sh
```

* 编辑`config.sh`文件

```shell
#!/usr/bin/env bash

chip=                       # 指定芯片型号

product=                    # 指定产品型号

language=                   # 指定支持的语言

host=
cross_gcc_path=             # 交叉编译工具链

configure_param=            # 指定configure中的参数

cppflag=                    # 编译相关参数
cflag=
cxxflag=
ldflag=
lib=

install_path=               # 安装路劲
```


### 增加`Makefile.am`

```shell
$ touch build-script/xxx_vender/Makefile.am
$ vim build-script/xxx_vender/Makefile.am

SUBDIRS = $(chip)

$ touch build-script/xxx_vender/xxx_chip/Makefile.am
$ vim build-script/xxx_vender/xxx_chip/Makefile.am

# ------------------
# defining variables
# ------------------
_dist_file_com  =

# ------------------
# make install files
# ------------------


# ---------------
# make dist files
# ---------------
_dist_file_com  += config.sh

EXTRA_DIST      = $(_dist_file_com)
```

### 配置`configure.ac`

```shell
$ vim configure.ac

找到AC_CONFIG_FILES，增加如下行
                 build-script/xxx_vender/xxx_chip/Makefile
                 build-script/xxx_vender/Makefile
```

### 修改`m4/select_vender.m4`

仿照文件中的任何一个平台，增加配置


### 修改`m4/select_chip.m4`

仿照文件中的任何一个芯片，增加配置

## thanks

欢迎大家提交`PR`或`Issues`

能给一个`Start`就是对我最大的鼓励^_^...

