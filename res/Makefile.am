# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile.am
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    08/03 2021 08:16
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        08/03 2021      create the file
# 
#     last modified: 08/03 2021 08:16
# ===============================================================

INSTALL_DATA_COM = \
				   Doxyfile

INSTALL_SCRIPTS_COM = \
					  get_project_info.sh

NO_INSTALL_SCRIPTS_COM =

noinst_SCRIPTS = $(NO_INSTALL_SCRIPTS_COM)
dist_bin_SCRIPTS = $(INSTALL_SCRIPTS_COM)

dist_data_DATA = $(INSTALL_DATA_COM)

install-data-hook:
	for file in ${INSTALL_DATA_COM}; do \
		rm -rf ${datarootdir}/$${file}; \
	done

install-exec-hook:
	for file in ${INSTALL_SCRIPTS_COM}; do \
		rm -rf ${bindir}/$${file}; \
	done

