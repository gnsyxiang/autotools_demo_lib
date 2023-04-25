dnl ===============================================================
dnl 
dnl Release under GPLv-3.0.
dnl 
dnl @file    select_chip.m4
dnl @brief   
dnl @author  gnsyxiang <gnsyxiang@163.com>
dnl @date    10/03 2022 20:11
dnl @version v0.0.1
dnl 
dnl @since    note
dnl @note     note
dnl 
dnl     change log:
dnl     NO.     Author              Date            Modified
dnl     00      zhenquan.qiu        10/03 2022      create the file
dnl 
dnl     last modified: 10/03 2022 20:11
dnl ===============================================================

# SELECT_CHIP()
# --------------------------------------------------------------
# select chip

AC_DEFUN([SELECT_CHIP],
    [
        chip=""

        AC_ARG_WITH([chip],
                    [AS_HELP_STRING([--with-chip=@<:@pc-chip|MC6810E|mx6ull|rk3568|SV823|at32f4xx@:>@],
                                    [select chip about @<:@pc-chip|MC6810E|mx6ull|rk3568|SV823|at32f4xx@:>@ @<:@default=pc-chip@:>@])],
                    [],
                    [with_chip=pc-chip])

        case "$with_chip" in
            pc-chip)
                AC_DEFINE(HAVE_SELECT_CHIP_PC,  1, [select pc chip])
                chip="pc-chip"
            ;;
            SV823)
                AC_DEFINE(HAVE_SELECT_CHIP_SV823,  1, [select SV823 chip])
                chip="SV823"
            ;;
            rk3568)
                AC_DEFINE(HAVE_SELECT_CHIP_RK3568,  1, [select rk3568 chip])
                chip="rk3568"
            ;;
            mx6ull)
                AC_DEFINE(HAVE_SELECT_CHIP_MX6ULL,  1, [select mx6ull chip])
                chip="mx6ull"
            ;;
            MC6810E)
                AC_DEFINE(HAVE_SELECT_CHIP_MC6810E,  1, [select MC6810E chip])
                chip="MC6810E"
            ;;
            at32f4xx)
                AC_DEFINE(HAVE_SELECT_CHIP_AT32F4XX,  1, [select at32f4xx chip])
                chip="at32f4xx"
            ;;
            *)
                AC_MSG_ERROR([bad value ${with_chip} for --with-chip=@<:@pc-chip|MC6810E|mx6ull|rk3568|SV823|at32f4xx@:>@])
            ;;
        esac

        AC_SUBST(chip)

        AM_CONDITIONAL([COMPILE_SELECT_CHIP_PC],        [test "x$with_chip" = "xpc-chip"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_SV823],     [test "x$with_chip" = "xSV823"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_RK3568],    [test "x$with_chip" = "xrk3568"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_MX6ULL],    [test "x$with_chip" = "xmx6ull"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_MC6810E],   [test "x$with_chip" = "xMC6810E"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_AT32F4XX],  [test "x$with_chip" = "xat32f4xx"])
    ])

