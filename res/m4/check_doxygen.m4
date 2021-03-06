dnl ===============================================================
dnl 
dnl Release under GPLv-3.0.
dnl 
dnl @file    check_doxygen.m4
dnl @brief   check doxygen
dnl @author  gnsyxiang <gnsyxiang@163.com>
dnl @date    19/01 2021 11:29
dnl @version v0.0.1
dnl 
dnl @since    note
dnl @note     note
dnl 
dnl     change log:
dnl     NO.     Author              Date            Modified
dnl     00      zhenquan.qiu        19/01 2021      create the file
dnl 
dnl     last modified: 19/01 2021 11:29
dnl ===============================================================

m4_define(
        [CHECK_DOXYGEN],
        [
            DX_HTML_FEATURE(ON)
            DX_MAN_FEATURE(OFF)
            DX_RTF_FEATURE(OFF)
            DX_XML_FEATURE(OFF)
            DX_PDF_FEATURE(OFF)
            DX_PS_FEATURE(OFF)
            DX_CHM_FEATURE(OFF)
            DX_CHI_FEATURE(OFF)
            DX_INIT_DOXYGEN([PROJECT_NAME], [${top_srcdir}/res/Doxyfile], [doxygen])

            AM_CONDITIONAL([ENABLE_DOXYGEN], [test "$DX_FLAG_doc" = "1"])
            AM_CONDITIONAL([ENABLE_DOXYGEN_MAN], [test "$DX_FLAG_man" = "1"])
        ])
