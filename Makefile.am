# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile.am
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    05/03 2021 10:32
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        05/03 2021      create the file
# 
#     last modified: 05/03 2021 10:32
# ===============================================================

include res/doxygen.am

SUBDIRS = include \
		  src \
		  example \
		  res

# --------
# cppflags
# --------
ACLOCAL_AMFLAGS 	= -I m4
no_error_com 		= -Wno-error=unused-result \
					  -Wno-unused-parameter \
					  -Wno-error=unused-but-set-variable
CPPFLAGS_COM 		= -pipe -W -Wall -Werror \
					  $(no_error_com) \
					  $(ACLOCAL_AMFLAGS)

LIB_CPPFLAGS_COM 	= -ffunction-sections \
					  -fdata-sections

# -----------
# lib ldflags
# -----------
LIB_LDFLAGS_COM = -rdynamic

# -----------
# bin ldflags
# -----------
BIN_LDFLAGS_COM = -Wl,--gc-sections

# ------------------
# make install files
# ------------------
INSTALL_FILES_COM 	= LICENSE \
					  README.md
dist_doc_DATA 		= $(INSTALL_FILES_COM)

pkgconfigdir 		= $(libdir)/pkgconfig
pkgconfig_DATA 		= @PACKAGE_NAME@.pc

# ---------------
# make dist files
# ---------------
DIST_FILES_COM 	= autogen.sh
EXTRA_DIST 		= $(DIST_FILES_COM)

# ----------
# export var
# ----------
export CPPFLAGS_COM
export LIB_CPPFLAGS_COM
export LIB_LDFLAGS_COM
export BIN_LDFLAGS_COM

# dist_bin_SCRIPTS = $(INSTALL_SCRIPTS_COM)
#install-exec-hook:
#	for file in ${INSTALL_SCRIPTS_COM}; do \
#		rm -rf ${bindir}/$${file}; \
#	done

#install-data-hook:
#	for file in ${INSTALL_DATA_COM}; do \
#		rm -rf ${datarootdir}/$${file}; \
#	done
