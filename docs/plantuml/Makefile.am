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

plantuml_dir_path 	= $(top_srcdir)/docs/plantuml
svg_path 			= $(abs_top_builddir)/docs/plantuml

plantuml_files 		= $(plantuml_dir_path)/*.plantuml
plantuml_jar 		= $(plantuml_dir_path)/plantuml.jar

all: mk_plantuml_2_svg

mk_plantuml_2_svg:
	for file_path in ${plantuml_files}; do 									\
		file=$${file_path##*/}; 											\
		svg_file=$${file%.*}.svg; 											\
		if [ -f $(svg_path)/$${file%.*}.svg ]; then 						\
			continue; 														\
		else 																\
			echo $${file_path}; 											\
			java -jar ${plantuml_jar} -tsvg $${file_path} -o $(svg_path); 	\
		fi 																	\
	done

