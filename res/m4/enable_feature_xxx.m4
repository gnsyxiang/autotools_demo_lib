dnl ===============================================================
dnl 
dnl Release under GPLv-3.0.
dnl 
dnl @file    enable_feature_xxx.m4
dnl @brief   
dnl @author  gnsyxiang <gnsyxiang@163.com>
dnl @date    15/03 2021 15:12
dnl @version v0.0.1
dnl 
dnl @since    note
dnl @note     note
dnl 
dnl     change log:
dnl     NO.     Author              Date            Modified
dnl     00      zhenquan.qiu        15/03 2021      create the file
dnl 
dnl     last modified: 15/03 2021 15:12
dnl ===============================================================

m4_define(
    [ENABLE_FEATURE_XXX],
    [
        AC_ARG_ENABLE(
            [feature_xxx],
            [AS_HELP_STRING([--enable-feature-xxx], [feature xxx] [[default=no]])],
            [AC_DEFINE(HAVE_ENABLE_FEATURE_XXX, 1, [feature xxx])])
        AM_CONDITIONAL([COMPILE_ENABLE_FEATURE_XXX], [test "x$enable_feature_xxx" = "xyes"])
    ])
