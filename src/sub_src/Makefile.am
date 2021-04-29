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

_include_com  	=
_sources_com 	=
_cppflags_com 	=
_cflags_com 	=
_cxxflags_com 	=
_ldflags_com 	=
_ldadd_com 		=

# ---------------------
# add necessary content
# ---------------------
_include_com  	+= -I$(top_srcdir)/include

_sources_com 	+= module_b.c

_cppflags_com 	+= $(CPPFLAGS_COM) \
				   $(_include_com)

_cflags_com 	+= $(CFLAGS_COM)

_cxxflags_com 	+= $(CXXFLAGS_COM)

_ldflags_com 	+= $(LIB_LDFLAGS_COM)

_ldadd_com 		+=

libmodule_b_la_SOURCES  = $(_sources_com)
libmodule_b_la_CPPFLAGS = $(_cppflags_com)
libmodule_b_la_CFLAGS 	= $(_cflags_com)
libmodule_b_la_CXXFLAGS = $(_cxxflags_com)
libmodule_b_la_LDFLAGS  = $(_ldflags_com)
libmodule_b_la_LIBADD   = $(_ldadd_com)
