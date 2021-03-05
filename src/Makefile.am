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

lib_LTLIBRARIES = libxxx.la

SOURCES_COM = \
			  xxx.c

INCLUDE_COM = \
			  -I$(top_srcdir)/include

NO_ERROR_COM = \
			   -Wno-error=unused-but-set-variable

CFLAGS_COM = \
			 $(INCLUDE_COM) \
			 $(NO_ERROR_COM) \
			 $(AM_CFLAGS_COM) \
			 -ffunction-sections \
			 -fdata-sections \
			 -fPIC

LIBADD_COM =
LDFLAGS_COM = \
			  -version-info @current@:@revision@:@age@ \
			  -rdynamic

AM_CFLAGS 			= $(CFLAGS_COM)
libxxx_la_SOURCES  	= $(SOURCES_COM)
libxxx_la_LIBADD   	= $(LIBADD_COM)
libxxx_la_LDFLAGS  	= $(LDFLAGS_COM)
