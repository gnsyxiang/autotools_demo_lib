dnl ===============================================================
dnl 
dnl Release under GPLv-3.0.
dnl 
dnl @file    select_vender.m4
dnl @brief   
dnl @author  gnsyxiang <gnsyxiang@163.com>
dnl @date    10/03 2022 14:49
dnl @version v0.0.1
dnl 
dnl @since    note
dnl @note     note
dnl 
dnl     change log:
dnl     NO.     Author              Date            Modified
dnl     00      zhenquan.qiu        10/03 2022      create the file
dnl 
dnl     last modified: 10/03 2022 14:49
dnl ===============================================================

# SELECT_VENDER()
# --------------------------------------------------------------
# select vender

AC_DEFUN([SELECT_VENDER],
    [
        vender=""

        AC_ARG_WITH([vender],
                    [AS_HELP_STRING([--with-vender=@<:@pc|rock-chips|esp32@:>@],
                                    [select vender about @<:@pc|rock-chips|esp32@:>@ @<:@default=pc@:>@])],
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
            esp32)
                AC_DEFINE(HAVE_SELECT_VENDER_ESP32,  1, [select esp32 vender])
                vender="esp32"
            ;;
            *)
                AC_MSG_ERROR([bad value ${with_vender} for --with-vender=@<:@pc|rock-chips|esp32@:>@])
            ;;
        esac

        AC_SUBST(vender)

        AM_CONDITIONAL([COMPILE_SELECT_VENDER_PC],          [test "x$with_vender" = "xpc"])
        AM_CONDITIONAL([COMPILE_SELECT_VENDER_ROCK_CHIPS],  [test "x$with_vender" = "xrock-chips"])
        AM_CONDITIONAL([COMPILE_SELECT_VENDER_ESP32],       [test "x$with_vender" = "xesp32"])
    ])
