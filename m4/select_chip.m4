# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    select_chip.m4
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    27/09 2025 10:16
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        27/09 2025      create the file
# 
#     last modified: 27/09 2025 10:16
# ===============================================================

AC_DEFUN([SELECT_CHIP],
    [
        series=""
        cmsis=""
        chip=""
        hal_driver=""
        linker_script=""

        AC_ARG_WITH([chip],
                    [AS_HELP_STRING([--with-chip=@<:@ubuntu|windows|rk3568|at32f4xx|stm32h743xx|stm32f429xx@:>@],
                                    [select chip about @<:@ubuntu|windows|rk3568|at32f4xx|stm32h743xx|stm32f429xx@:>@ @<:@default=xubuntu@:>@])],
                    [],
                    [with_chip=stm32h743xx])

        case "$with_chip" in
            ubuntu)
                AC_DEFINE(HAVE_SELECT_CHIP_UBUNTU,  1, [select ubuntu chip])
                AC_DEFINE(HAVE_SELECT_OS_LINUX,  1, [select linux os])
                chip="ubuntu"
            ;;
            windows)
                AC_DEFINE(HAVE_SELECT_CHIP_WINDOWS,  1, [select windows chip])
                AC_DEFINE(HAVE_SELECT_OS_WINDOWS,  1, [select windows os])
                chip="windows"
            ;;
            rk3568)
                AC_DEFINE(HAVE_SELECT_CHIP_RK3568,  1, [select rk3568 chip])
                AC_DEFINE(HAVE_SELECT_OS_LINUX,  1, [select linux os])
                chip="rk3568"
            ;;
            at32f4xx)
                AC_DEFINE(HAVE_SELECT_CHIP_AT32F4XX,  1, [select at32f4xx chip])
                series="at32f4xx"
                chip="at32f4xx"
            ;;
            stm32h743xx)
                AC_DEFINE(HAVE_SELECT_CHIP_STM32H743XX,  1, [select stm32h743xx chip])
                series="stm32h7xx"
                chip="stm32h743xx"
                cmsis="cmsis-device-h7"
                hal_driver="stm32h7xx-hal-driver"
                linker_script="STM32H743ZITx_FLASH"
            ;;
            stm32f429xx)
                AC_DEFINE(HAVE_SELECT_CHIP_STM32F429XX,  1, [select stm32f429xx chip])
                series="stm32f4xx"
                chip="stm32f429xx"
                cmsis="cmsis-device-f4"
                hal_driver="stm32f4xx-hal-driver"
                linker_script="STM32F429ZGTx_FLASH"
            ;;
            *)
                AC_MSG_ERROR([bad value ${with_chip} for --with-chip=@<:@ubuntu|windows|rk3568|stm32h743xx|stm32f429xx@:>@])
            ;;
        esac

        AC_SUBST(chip)
        AC_SUBST(cmsis)
        AC_SUBST(series)
        AC_SUBST(hal_driver)
        AC_SUBST(linker_script)

        AM_CONDITIONAL([COMPILE_SELECT_CHIP_MEM_MANG_4], [test "x$with_chip" = "xstm32f429xx" || test "x$with_chip" = "xstm32h743xx"])

        AM_CONDITIONAL([COMPILE_SELECT_CHIP_UBUNTU],            [test "x$with_chip" = "xubuntu"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_WINDOWS],           [test "x$with_chip" = "xwindows"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_RK3568],            [test "x$with_chip" = "xrk3568"])

        AM_CONDITIONAL([COMPILE_SELECT_CHIP_AT32F4XX],          [test "x$with_chip" = "xat32f4xx"])

        AM_CONDITIONAL([COMPILE_SELECT_CHIP_STM32F4XX],         [test "x$with_chip" = "xstm32f429xx"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_STM32F429XX],       [test "x$with_chip" = "xstm32f429xx"])

        AM_CONDITIONAL([COMPILE_SELECT_SERIES_STM32H7XX],       [test "x$with_chip" = "xstm32h743xx"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_STM32H743XX],       [test "x$with_chip" = "xstm32h743xx"])
    ])

