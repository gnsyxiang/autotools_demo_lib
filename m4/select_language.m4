# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    select_language.m4
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    27/09 2025 10:19
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        27/09 2025      create the file
# 
#     last modified: 27/09 2025 10:19
# ===============================================================

AC_DEFUN([SELECT_LANGUAGE],
    [
        language=""

        AC_ARG_WITH([language],
            [AS_HELP_STRING([--with-language=@<:@cn|en@:>@], [select language about @<:@cn|en@:>@ @<:@default=cn@:>@])],
            [],
            [with_language=cn])

        case "$with_language" in
            cn)
                AC_DEFINE(HAVE_SELECT_LANGUAGE_CN,  1, [select cn language])
                language="cn"
            ;;
            en)
                AC_DEFINE(HAVE_SELECT_LANGUAGE_EN,  1, [select en language])
                language="en"
            ;;
            *)
                AC_MSG_ERROR([bad value ${with_language} for --with-language=@<:@cn|en@:>@])
            ;;
        esac

        AC_SUBST(language)

        AM_CONDITIONAL([COMPILE_SELECT_LANGUAGE_CN],        [test "x$with_language" = "xcn"])
        AM_CONDITIONAL([COMPILE_SELECT_LANGUAGE_EN],        [test "x$with_language" = "xen"])
    ])

