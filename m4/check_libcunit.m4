dnl ===============================================================
dnl 
dnl Release under GPLv-3.0.
dnl 
dnl @file    check_libcunit.m4
dnl @brief   
dnl @author  gnsyxiang <gnsyxiang@163.com>
dnl @date    08/05 2021 10:29
dnl @version v0.0.1
dnl 
dnl @since    note
dnl @note     note
dnl 
dnl     change log:
dnl     NO.     Author              Date            Modified
dnl     00      zhenquan.qiu        08/05 2021      create the file
dnl 
dnl     last modified: 08/05 2021 10:29
dnl ===============================================================

# CHECK_LIBCUNIT()
# --------------------------------------------------------------
# check libcunit

AC_DEFUN([CHECK_LIBCUNIT], [

    AC_ARG_ENABLE([cunit],
        [AS_HELP_STRING([--disable-cunit], [disable support for cunit])],
            [], [enable_cunit=yes])

    case "$enable_cunit" in
        yes)
            have_cunit=no

            case "$PKG_CONFIG" in
                '') ;;
                *)
                    CUNIT_LIBS=`$PKG_CONFIG --libs cunit 2>/dev/null`

                    case "$CUNIT_LIBS" in
                        '') ;;
                        *)
                            CUNIT_LIBS="$CUNIT_LIBS"
                            have_cunit=yes
                        ;;
                    esac

                    CUNIT_INCS=`$PKG_CONFIG --cflags cunit 2>/dev/null`
                ;;
            esac

            case "$have_cunit" in
                yes) ;;
                *)
                    save_LIBS="$LIBS"
                    LIBS=""
                    CUNIT_LIBS=""

                    # clear cache
                    unset ac_cv_search_CU_initialize_registry
                    AC_SEARCH_LIBS([CU_initialize_registry], [cunit],
                            [have_cunit=yes
                                CUNIT_LIBS="$LIBS"],
                            [have_cunit=no],
                            [])
                    LIBS="$save_LIBS"
                ;;
            esac

            CPPFLAGS_SAVE=$CPPFLAGS
            CPPFLAGS="$CPPFLAGS $CUNIT_INCS"
            AC_CHECK_HEADERS([CUnit/CUnit.h], [], [have_cunit=no])

            CPPFLAGS=$CPPFLAGS_SAVE
            AC_SUBST(CUNIT_INCS)
            AC_SUBST(CUNIT_LIBS)

            case "$have_cunit" in
                yes)
                    AC_CHECK_LIB([cunit], [CU_initialize_registry])
                    AC_DEFINE(HAVE_cunit, 1, [Define if the system has cunit])
                ;;
                *)
                    AC_MSG_WARN([cunit is a must but can not be found. You should add the \
directory containing `cunit.pc' to the `PKG_CONFIG_PATH' environment variable, \
or set `CPPFLAGS' and `LDFLAGS' directly for cunit, or use `--disable-cunit' \
to disable support for cunit encryption])
                ;;
            esac
        ;;
    esac

    # check if we have and should use cunit
    AM_CONDITIONAL(COMPILE_LIBCUNIT, [test "$enable_cunit" != "no" && test "$have_cunit" = "yes"])
])

