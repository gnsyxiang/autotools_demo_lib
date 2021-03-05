# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile.am
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    05/03 2021 10:35
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        05/03 2021      create the file
# 
#     last modified: 05/03 2021 10:35
# ===============================================================

SUBDIRS = \
		  sub_src

lib_LTLIBRARIES = libxxx.la

SOURCES_COM = \
			  xxx.c

INCLUDE_COM = \
			  -I$(top_srcdir)/include

CFLAGS_COM = \
			 -ffunction-sections \
			 -fdata-sections \
			 $(AM_CFLAGS_COM) \
			 $(INCLUDE_COM)

LIBADD_COM = \
			 $(top_builddir)/src/sub_src/libaaa.la

LDFLAGS_COM = \
			  -version-info @current@:@revision@:@age@ \
			  -rdynamic

AM_CFLAGS 			= $(CFLAGS_COM)
libxxx_la_SOURCES  	= $(SOURCES_COM)
libxxx_la_LIBADD   	= $(LIBADD_COM)
libxxx_la_LDFLAGS  	= $(LDFLAGS_COM)
