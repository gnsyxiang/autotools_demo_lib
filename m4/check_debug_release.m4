# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    check_debug_release.m4
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    27/09 2025 11:19
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        27/09 2025      create the file
# 
#     last modified: 27/09 2025 11:19
# ===============================================================

AC_DEFUN([CHECK_DEBUG_RELEASE], [

        AC_ARG_ENABLE([debug_info], [AS_HELP_STRING([--enable-debug_info], [enable support for output debug info])], [], [enable_debug_info=no])

        case "$enable_debug_info" in
            yes)
                AC_DEFINE(HAVE_ENABLE_DEBUG_INFO,  1, [enable debug info])
                AC_MSG_NOTICE([build debug])
            ;;
            no)
                AC_MSG_NOTICE([build release])
            ;;
            *)
                AC_MSG_ERROR([error type for --enable-debug_info])
            ;;
        esac

        AM_CONDITIONAL(COMPILE_DEBUG_INFO, [test "$enable_debug_info" = "yes"])
    ]
)

