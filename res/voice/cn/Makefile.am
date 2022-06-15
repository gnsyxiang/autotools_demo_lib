# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile.am
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    23/03 2022 19:08
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        23/03 2022      create the file
# 
#     last modified: 23/03 2022 19:08
# ===============================================================

# ------------------
# defining variables
# ------------------
_install_files_com  =
_dist_file_com      =
voicedir            = $(prefix)/res/voice
voice_DATA          =

# ---------------------
# add necessary content
# ---------------------

# ---------------
# make dist files
# ---------------
_dist_file_com      += \
                       demo.pcm

EXTRA_DIST          = $(_dist_file_com)

# ------------------
# make install files
# ------------------
_install_files_com  += demo.pcm
voice_DATA          += $(_install_files_com)

