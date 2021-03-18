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

noinst_LTLIBRARIES = libmodule_b.la

sources_com 	=
include_com  	=
cppflags_com 	=
ldadd_com 		=
ldflags_com 	=

# ---------------------
# add necessary content
# ---------------------
sources_com 	+= module_b.c

include_com  	+= -I$(top_srcdir)/include
cppflags_com 	+= $(LIB_CPPFLAGS_COM) \
				   $(CPPFLAGS_COM) \
				   $(include_com)

ldadd_com 		+=

ldflags_com 	+= $(LIB_LDFLAGS_COM)

AM_CFLAGS 				= $(cppflags_com)
libmodule_b_la_SOURCES  = $(sources_com)
libmodule_b_la_LIBADD   = $(ldadd_com)
libmodule_b_la_LDFLAGS  = $(ldflags_com)
