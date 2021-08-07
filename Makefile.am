# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile.am
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    05/03 2021 10:32
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        05/03 2021      create the file
# 
#     last modified: 05/03 2021 10:32
# ===============================================================

include res/doxygen.am

SUBDIRS = \
          include \
          src \
          doc \
          res

if COMPILE_SELECT_TARGET_OS_LINUX
SUBDIRS += example
endif

# ------------------
# defining variables
# ------------------
_no_error_com       =
_remove_unuse_func  =
_install_files_com  =
_dist_files_com     =

CPPFLAGS_COM        =
CFLAGS_COM          =
CXXFLAGS_COM        =
LIB_LDFLAGS_COM     =
BIN_LDFLAGS_COM     =

ACLOCAL_AMFLAGS     = -I m4
pkgconfigdir        = $(libdir)/pkgconfig

# ---------------------
# add necessary content
# ---------------------
_no_error_com       += \
                       -W -Wall -Werror \
                       -Wno-error=unused-but-set-variable \
                       -Wno-error=unused-variable \
                       -Wno-error=unused-function

# 下面两个参数一个显示警告，一个直接通过
_no_error_com       += -Wno-error=unused-parameter
# _no_error_com         += -Wno-unused-parameter

CPPFLAGS_COM        += \
                       -pipe \
                       $(_no_error_com) \
                       $(ACLOCAL_AMFLAGS)

# 用来通知链接器将所有符号添加到动态符号表中
#（目的是能够通过使用 dlopen 来实现向后跟踪）
LIB_LDFLAGS_COM     += -rdynamic

# 不链接未使用函数，减小可执行文件大小
_remove_unuse_func  += \
                       -ffunction-sections \
                       -fdata-sections
CFLAGS_COM          += $(_remove_unuse_func)
CXXFLAGS_COM        += $(_remove_unuse_func)
BIN_LDFLAGS_COM     += -Wl,--gc-sections

# 用户指定的库全部链接，不管有没有使用
# BIN_LDFLAGS_COM     += -Wl,--no-as-needed

# 用户指定的库按需链接
BIN_LDFLAGS_COM     += -Wl,--as-needed

# 部分库不管有没有使用都链接，其他库按照需要链接
# note: 指定参数后面的链接库一律按照前面的参数，直到修改相同功能的配置参数
# BIN_LDFLAGS_COM     += -Wl,--no-as-needed -lpthread -Wl,--as-needed

export CPPFLAGS_COM
export CFLAGS_COM
export CXXFLAGS_COM
export LIB_LDFLAGS_COM
export BIN_LDFLAGS_COM

# ------------------
# make install files
# ------------------
_install_files_com  += \
                       LICENSE \
                       README.md
dist_doc_DATA       = $(_install_files_com)
pkgconfig_DATA      = @project_name@.pc

# ---------------
# make dist files
# ---------------
_dist_files_com     += \
                       autogen.sh \
                       build.sh \
                       @project_name@.pc.in
EXTRA_DIST          = $(_dist_files_com)

DISTCLEANFILES = @project_name@.pc

