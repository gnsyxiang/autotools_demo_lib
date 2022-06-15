# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile.am
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    21/03 2022 19:14
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        21/03 2022      create the file
# 
#     last modified: 21/03 2022 19:14
# ===============================================================

# ------------------
# defining variables
# ------------------
_dist_file_com  =

# ------------------
# make install files
# ------------------


# ---------------
# make dist files
# ---------------
_dist_file_com  += config.sh

EXTRA_DIST      = $(_dist_file_com)

dist-hook:
	@echo "modify configure.ac"; \
		\
		sed -i 's/product=.*/product=$(product)/g' $(top_distdir)/build-script/$(vender)/$(chip)/config.sh; \
		sed -i 's/language=.*/language=$(language)/g' $(top_distdir)/build-script/$(vender)/$(chip)/config.sh; \
		\
		sed -i '/build-script/d' $(top_distdir)/configure.ac; \
		sed -i '/project_name.pc/a build-script/$(vender)/$(chip)/Makefile' $(top_distdir)/configure.ac; \
		sed -i '/project_name.pc/a build-script/$(vender)/Makefile' $(top_distdir)/configure.ac; \
		sed -i '/project_name.pc/a build-script/Makefile' $(top_distdir)/configure.ac; \
		\
		sed -i '/res\/voice/d' $(top_distdir)/configure.ac; \
		sed -i '/project_name.pc/a res/voice/Makefile' $(top_distdir)/configure.ac; \
		sed -i '/project_name.pc/a res/voice/$(language)/Makefile' $(top_distdir)/configure.ac

