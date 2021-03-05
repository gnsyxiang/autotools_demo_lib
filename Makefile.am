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

ACLOCAL_AMFLAGS = -I m4

AM_CFLAGS_COM = \
				$(ACLOCAL_AMFLAGS) \
				-pipe -W -Wall -Werror \
				-Wno-error=unused-result \
				-Wno-unused-parameter
export AM_CFLAGS_COM

dist_doc_DATA = \
				LICENSE \
				README.md

SUBDIRS = \
		  include \
		  src \
		  example

include res/doxygen.am
