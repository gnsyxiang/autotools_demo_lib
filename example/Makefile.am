# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile.am
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    05/03 2021 10:38
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        05/03 2021      create the file
# 
#     last modified: 05/03 2021 10:38
# ===============================================================

INCLUDE_COM = \
			  -I$(top_srcdir)/include

CFLAGS_COM = \
			 $(AM_CFLAGS_COM) \
			 $(INCLUDE_COM)

LDADD_COM = \
			-lxxx

LDFLAGS_COM = \
			  -Wl,--gc-sections \
			  -L$(top_builddir)/src/.libs

bin_PROGRAMS 	=

bin_PROGRAMS	+= main
main_SOURCES 	= main.c
main_CFLAGS  	= $(CFLAGS_COM)
main_LDADD   	= $(LDADD_COM)
main_LDFLAGS	= $(LDFLAGS_COM)
