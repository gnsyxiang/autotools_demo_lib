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

lib_LTLIBRARIES = lib@project_name@.la

SOURCES_COM = \
			  module_a.c

INCLUDE_COM = \
			  -I$(top_srcdir)/include

CFLAGS_COM = \
			 -ffunction-sections \
			 -fdata-sections \
			 $(AM_CFLAGS_COM) \
			 $(INCLUDE_COM)

LIBADD_COM = \
			 $(top_builddir)/src/sub_src/libmodule_b.la

LDFLAGS_COM = \
			  -export-symbols-regex 'Hy*' \
			  -rdynamic \
			  -version-info @current@:@revision@:@age@

AM_CFLAGS 						= $(CFLAGS_COM)
lib@project_name@_la_SOURCES  	= $(SOURCES_COM)
lib@project_name@_la_LIBADD   	= $(LIBADD_COM)
lib@project_name@_la_LDFLAGS  	= $(LDFLAGS_COM)
