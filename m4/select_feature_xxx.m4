dnl ===============================================================
dnl 
dnl Release under GPLv-3.0.
dnl 
dnl @file    select_feature_xxx.m4
dnl @brief   
dnl @author  gnsyxiang <gnsyxiang@163.com>
dnl @date    19/03 2021 08:16
dnl @version v0.0.1
dnl 
dnl @since    note
dnl @note     note
dnl 
dnl     change log:
dnl     NO.     Author              Date            Modified
dnl     00      zhenquan.qiu        19/03 2021      create the file
dnl 
dnl     last modified: 19/03 2021 08:16
dnl ===============================================================

m4_define(
   [SELECT_FEATURE_XXX],
   [
       with_feature_xxx=a

       AC_ARG_WITH(
           [feature_xxx],
           [AS_HELP_STRING([--with-feature-xxx=a/b/c], [feature xxx about a/b/c] [[default=a]])],
           [
               case "$with_feature_xxx" in
                   a) AC_DEFINE(HAVE_SELECT_FEATURE_XXX_A, 1, [select feature xxx a]) ;;
                   b) AC_DEFINE(HAVE_SELECT_FEATURE_XXX_B, 1, [select feature xxx b]) ;;
                   c) AC_DEFINE(HAVE_SELECT_FEATURE_XXX_C, 1, [select feature xxx c]) ;;
                   *) AC_MSG_ERROR([bad value ${with_feature_xxx} for --with-feature-xxx=a/b/c]) ;;
               esac
           ])

       AM_CONDITIONAL([COMPILE_SELECT_FEATURE_XXX_A], [test "x$with_feature_xxx" = "xa"])
       AM_CONDITIONAL([COMPILE_SELECT_FEATURE_XXX_B], [test "x$with_feature_xxx" = "xb"])
       AM_CONDITIONAL([COMPILE_SELECT_FEATURE_XXX_C], [test "x$with_feature_xxx" = "xc"])
   ])
