# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile.am
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    13/04 2021 08:13
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        13/04 2021      create the file
# 
#     last modified: 13/04 2021 08:13
# ===============================================================

# ------------------
# make install files
# ------------------
_pic_files_com 		= sequence_diagram-deinit.svg \
					  sequence_diagram-init.svg
pic_docdir 			= $(docdir)/pic
pic_doc_DATA 		= $(_pic_files_com)

# build
SUFFIXES = .svg.haha

java_verbose = $(java_verbose_@AM_V@)
java_verbose_ = $(java_verbose_@AM_DEFAULT_V@)
java_verbose_0 = @echo "  JAVA      " $@;

.plantuml.svg:
	$(java_verbose)java -jar plantuml.jar -tsvg $<

BUILT_SOURCES = ${_pic_files_com}

