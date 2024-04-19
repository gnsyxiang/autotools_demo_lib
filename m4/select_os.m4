# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    select_os.m4
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    19/04 2024 17:08
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        19/04 2024      create the file
# 
#     last modified: 19/04 2024 17:08
# ===============================================================

AC_DEFUN([SELECT_OS],
    [
        run_os=""

        AC_ARG_WITH([os],
                    [AS_HELP_STRING([--with-os=@<:@linux|windows|freertos@:>@],
                                    [select os about @<:@linux|windows|freertos@:>@ @<:@default=linux@:>@])],
                    [],
                    [with_os=linux])

        case "$with_os" in
            linux)
                AC_DEFINE(HAVE_SELECT_OS_LINUX,  1, [select linux os])
                run_os="linux"
            ;;
            windows)
                AC_DEFINE(HAVE_SELECT_OS_WINDOWS,  1, [select windows os])
                run_os="windows"
            ;;
            freertos)
                AC_DEFINE(HAVE_SELECT_OS_FREERTOS,  1, [select freertos os])
                run_os="freertos"
            ;;
            *)
                AC_MSG_ERROR([bad value ${with_os} for --with-os=@<:@linux|windows|freertos@:>@])
            ;;
        esac

        AC_SUBST(run_os)

        AM_CONDITIONAL([COMPILE_SELECT_OS_LINUX],      [test "x$with_os" = "xlinux"])
        AM_CONDITIONAL([COMPILE_SELECT_OS_WINDOWS],     [test "x$with_os" = "xwindows"])
        AM_CONDITIONAL([COMPILE_SELECT_OS_FREERTOS],    [test "x$with_os" = "xfreertos"])
    ])
