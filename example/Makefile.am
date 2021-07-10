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

# ------------------
# defining variables
# ------------------
_include_com    =
_sources_com    =
_cppflags_com   =
_cflags_com     =
_cxxflags_com   =
_ldflags_com    =
_ldadd_com      =
bin_PROGRAMS    =

_install_com    =
exampledir      = $(prefix)/example

# ---------------------
# add necessary content
# ---------------------
_include_com    += -I$(top_srcdir)/include

_sources_com    +=

_cppflags_com   += \
                   $(CPPFLAGS_COM) \
                   $(_include_com)

_cflags_com     += $(CFLAGS_COM)

_cxxflags_com   += $(CXXFLAGS_COM)

_ldflags_com    += $(BIN_LDFLAGS_COM)

_ldadd_com      += $(top_builddir)/src/lib@project_name@.la

bin_PROGRAMS    += test
test_SOURCES    = $(_sources_com) test.c
test_CPPFLAGS   = $(_cppflags_com)
test_CFLAGS     = $(_cflags_com)
test_CXXFLAGS   = $(_cxxflags_com)
test_LDFLAGS    = $(_ldflags_com)
test_LDADD      = $(_ldadd_com)

# ------------------
# make install files
# ------------------
_install_com    += \
                   main.c \
                   main_Makefile
dist_example_DATA = $(_install_com)

install-data-hook:
	mv ${exampledir}/main_Makefile ${exampledir}/Makefile

