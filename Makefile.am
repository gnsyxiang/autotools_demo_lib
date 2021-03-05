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

NO_ERROR_COM = \
			   -Wno-error=unused-result \
			   -Wno-unused-parameter \
			   -Wno-error=unused-but-set-variable

AM_CFLAGS_COM = \
				-pipe -W -Wall -Werror \
				$(NO_ERROR_COM) \
				$(ACLOCAL_AMFLAGS)
export AM_CFLAGS_COM

dist_doc_DATA = \
				LICENSE \
				README.md

SUBDIRS = \
		  include \
		  src \
		  example

include res/doxygen.am
