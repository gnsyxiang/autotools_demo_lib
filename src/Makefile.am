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

SUBDIRS = sub_src

lib_LTLIBRARIES = lib@project_name@.la

sources_com 	=
include_com  	=
cppflags_com 	=
ldadd_com 		=
ldflags_com 	=

# ---------------------
# add necessary content
# ---------------------
sources_com 	+= module_a.c

include_com 	+= -I$(top_srcdir)/include
cppflags_com 	+= $(LIB_CPPFLAGS_COM) \
				   $(CPPFLAGS_COM) \
				   $(include_com)

ldadd_com 		+= $(top_builddir)/src/sub_src/libmodule_b.la

ldflags_com 	+= -export-symbols-regex 'Hy*' \
				   -version-info @current@:@revision@:@age@ \
				   $(LIB_LDFLAGS_COM)

AM_CFLAGS 						= $(cppflags_com)
lib@project_name@_la_SOURCES  	= $(sources_com)
lib@project_name@_la_LIBADD   	= $(ldadd_com)
lib@project_name@_la_LDFLAGS  	= $(ldflags_com)
