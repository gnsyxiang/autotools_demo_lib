# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile.am
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    12/04 2021 16:13
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        12/04 2021      create the file
# 
#     last modified: 12/04 2021 16:13
# ===============================================================

SUBDIRS = plantuml

# ------------------
# make install files
# ------------------
install_files_com 	= sequence_diagram.md
dist_doc_DATA 		= $(install_files_com)

svg_path 			= $(abs_top_builddir)/docs/plantuml
pic_files_com 		= $(svg_path)/sequence_diagram-deinit.svg \
					  $(svg_path)/sequence_diagram-init.svg
pic_docdir 			= $(docdir)/pic
pic_doc_DATA 		= $(pic_files_com)
