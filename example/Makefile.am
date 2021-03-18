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

include_com  	=
cppflags_com 	=
ldadd_com 		=
ldflags_com 	=
bin_PROGRAMS 	=

# ---------------------
# add necessary content
# ---------------------
include_com  	+= -I$(top_srcdir)/include
cppflags_com 	+= $(CPPFLAGS_COM) \
				   $(include_com)

ldadd_com 		+= $(top_builddir)/src/lib@project_name@.la

ldflags_com 	+= $(BIN_LDFLAGS_COM)

bin_PROGRAMS	+= main
main_SOURCES 	= main.c
main_CPPFLAGS  	= $(cppflags_com)
main_LDADD   	= $(ldadd_com)
main_LDFLAGS	= $(ldflags_com)
