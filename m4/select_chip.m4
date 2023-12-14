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
        run_os=""

        AC_ARG_WITH([chip],
                    [AS_HELP_STRING([--with-chip=@<:@ubuntu-pc|windows-pc|MC6810E|mx6ull|esp32|stm32h7xx|rk3568|SV823|at32f4xx@:>@],
                                    [select chip about @<:@ubuntu-pc|windows-pc|MC6810E|mx6ull|esp32|stm32h7xx|rk3568|SV823|at32f4xx@:>@ @<:@default=ubuntu-pc@:>@])],
                    [],
                    [with_chip=ubuntu-pc])

        case "$with_chip" in
            ubuntu-pc)
                AC_DEFINE(HAVE_SELECT_CHIP_UBUNTU_PC,  1, [select ubuntu pc chip])
                AC_DEFINE(HAVE_SELECT_OS_LINUX,  1, [select linux os])
                chip="ubuntu-pc"
                run_os="linux"
            ;;
            SV823)
                AC_DEFINE(HAVE_SELECT_CHIP_SV823,  1, [select SV823 chip])
                AC_DEFINE(HAVE_SELECT_OS_LINUX,  1, [select linux os])
                chip="SV823"
                run_os="linux"
            ;;
            rk3568)
                AC_DEFINE(HAVE_SELECT_CHIP_RK3568,  1, [select rk3568 chip])
                AC_DEFINE(HAVE_SELECT_OS_LINUX,  1, [select linux os])
                chip="rk3568"
                run_os="linux"
            ;;
            mx6ull)
                AC_DEFINE(HAVE_SELECT_CHIP_MX6ULL,  1, [select mx6ull chip])
                AC_DEFINE(HAVE_SELECT_OS_LINUX,  1, [select linux os])
                chip="mx6ull"
                run_os="linux"
            ;;
            MC6810E)
                AC_DEFINE(HAVE_SELECT_CHIP_MC6810E,  1, [select MC6810E chip])
                AC_DEFINE(HAVE_SELECT_OS_LINUX,  1, [select linux os])
                chip="MC6810E"
                run_os="linux"
            ;;
            windows-pc)
                AC_DEFINE(HAVE_SELECT_CHIP_WINDOWS_PC,  1, [select windows pc chip])
                AC_DEFINE(HAVE_SELECT_OS_WINDOWS,  1, [select windows os])
                chip="windows-pc"
                run_os="windows"
            ;;
            stm32h7xx)
                AC_DEFINE(HAVE_SELECT_CHIP_STM32H7XX,  1, [select stm32h7xx chip])
                AC_DEFINE(HAVE_SELECT_OS_MCU,  1, [select mcu os])
                chip="stm32h7xx"
                run_os="mcu"
            ;;
            esp32)
                AC_DEFINE(HAVE_SELECT_CHIP_ESP32,  1, [select esp32 chip])
                AC_DEFINE(HAVE_SELECT_OS_MCU,  1, [select mcu os])
                chip="esp32"
                run_os="mcu"
            ;;
            at32f4xx)
                AC_DEFINE(HAVE_SELECT_CHIP_AT32F4XX,  1, [select at32f4xx chip])
                AC_DEFINE(HAVE_SELECT_OS_MCU,  1, [select mcu os])
                chip="at32f4xx"
                run_os="mcu"
            ;;
            *)
                AC_MSG_ERROR([bad value ${with_chip} for --with-chip=@<:@ubuntu-pc|windows-pc|MC6810E|mx6ull|esp32|stm32h7xx|rk3568|SV823|at32f4xx@:>@])
            ;;
        esac

        AC_SUBST(chip)
        AC_SUBST(run_os)

        AM_CONDITIONAL([COMPILE_SELECT_CHIP_UBUNTU_PC], [test "x$with_chip" = "xubuntu-pc"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_SV823],     [test "x$with_chip" = "xSV823"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_RK3568],    [test "x$with_chip" = "xrk3568"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_MX6ULL],    [test "x$with_chip" = "xmx6ull"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_MC6810E],   [test "x$with_chip" = "xMC6810E"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_WINDOWS_PC],[test "x$with_chip" = "xwindows-pc"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_STM32H7XX], [test "x$with_chip" = "xstm32h7xx"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_ESP32],     [test "x$with_chip" = "xesp32"])
        AM_CONDITIONAL([COMPILE_SELECT_CHIP_AT32F4XX],  [test "x$with_chip" = "xat32f4xx"])
    ])

