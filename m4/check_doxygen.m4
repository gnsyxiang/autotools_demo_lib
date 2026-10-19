# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    check_doxygen.m4
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    27/09 2025 11:21
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        27/09 2025      create the file
# 
#     last modified: 27/09 2025 11:21
# ===============================================================

AC_DEFUN([CHECK_DOXYGEN],
    [
        DX_HTML_FEATURE(ON)
        DX_MAN_FEATURE(OFF)
        DX_RTF_FEATURE(OFF)
        DX_XML_FEATURE(OFF)
        DX_PDF_FEATURE(OFF)
        DX_PS_FEATURE(OFF)
        DX_CHM_FEATURE(OFF)
        DX_CHI_FEATURE(OFF)
        DX_INIT_DOXYGEN([PROJECT_NAME], [${top_srcdir}/res/Doxyfile], [doc/doxygen])

        if test x"${enable_doxygen_doc}" == x"yes" ; then
            AC_CHECK_PROG([DOXYGEN], [doxygen], [yes])
            if test x"${DOXYGEN}" != x"yes" ; then
                AC_MSG_ERROR([Please install doxygen with 'sudo apt install -y doxygen'.])
            fi

            AC_CHECK_PROG([DOT], [dot], [yes])
            if test x"${DOT}" != x"yes" ; then
                AC_MSG_ERROR([Please install graphviz with 'sudo apt install -y graphviz'.])
            fi
        fi

        AM_CONDITIONAL([ENABLE_DOXYGEN], [test "$DX_FLAG_doc" = "1"])
        AM_CONDITIONAL([ENABLE_DOXYGEN_MAN], [test "$DX_FLAG_man" = "1"])
    ]
)

