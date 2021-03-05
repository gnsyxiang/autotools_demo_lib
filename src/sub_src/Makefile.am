# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile.am
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    05/03 2021 17:09
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        05/03 2021      create the file
# 
#     last modified: 05/03 2021 17:09
# ===============================================================

noinst_LTLIBRARIES = libaaa.la

SOURCES_COM = \
			  aaa.c

INCLUDE_COM = \
			  -I$(top_srcdir)/include

CFLAGS_COM = \
			 -ffunction-sections \
			 -fdata-sections \
			 $(AM_CFLAGS_COM) \
			 $(INCLUDE_COM)

LIBADD_COM =

LDFLAGS_COM = \
			  -rdynamic

AM_CFLAGS 			= $(CFLAGS_COM)
libaaa_la_SOURCES  	= $(SOURCES_COM)
libaaa_la_LIBADD   	= $(LIBADD_COM)
libaaa_la_LDFLAGS  	= $(LDFLAGS_COM)
