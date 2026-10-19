# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    select_vender.m4
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    27/09 2025 10:14
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        27/09 2025      create the file
# 
#     last modified: 27/09 2025 10:14
# ===============================================================

AC_DEFUN([SELECT_VENDER],
    [
        vender=""

        AC_ARG_WITH([vender],
                    [AS_HELP_STRING([--with-vender=@<:@pc|rock-chips|stm32@:>@],
                                    [select vender about @<:@pc|rock-chips|stm32@:>@ @<:@default=pc@:>@])],
                    [],
                    [with_vender=pc])

        case "$with_vender" in
            pc)
                AC_DEFINE(HAVE_SELECT_VENDER_PC,  1, [select pc vender])
                vender="pc"
            ;;
            rock-chips)
                AC_DEFINE(HAVE_SELECT_VENDER_ROCK_CHIPS,  1, [select rock-chips vender])
                vender="rock-chips"
            ;;
            stm32)
                AC_DEFINE(HAVE_SELECT_VENDER_STM32,  1, [select stm32 vender])
                vender="stm32"
            ;;
            *)
                AC_MSG_ERROR([bad value ${with_vender} for --with-vender=@<:@pc|rock-chips|stm32@:>@])
            ;;
        esac

        AC_SUBST(vender)

        AM_CONDITIONAL([COMPILE_SELECT_VENDER_PC],          [test "x$with_vender" = "xpc"])
        AM_CONDITIONAL([COMPILE_SELECT_VENDER_ROCK_CHIPS],  [test "x$with_vender" = "xrock-chips"])
        AM_CONDITIONAL([COMPILE_SELECT_VENDER_STM32],       [test "x$with_vender" = "xstm32"])
    ])

