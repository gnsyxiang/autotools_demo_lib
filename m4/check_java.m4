# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    check_java.m4
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    27/09 2025 11:22
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        27/09 2025      create the file
# 
#     last modified: 27/09 2025 11:22
# ===============================================================

AC_DEFUN([CHECK_JAVA], [
        AC_CHECK_PROG([JAVA], [java], [yes])
        AM_CONDITIONAL([HAVA_JAVA_PROGRAM], [test "x$JAVA" = "xyes"])
    ]
)

