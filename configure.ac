#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])

m4_include([m4/check_project_info.m4])

m4_include([res/m4/check_doxygen.m4])
m4_include([res/m4/ax_prog_doxygen.m4])

m4_include([res/m4/enable_feature_xxx.m4])
m4_include([res/m4/select_feature_xxx.m4])

AC_INIT([PROJECT_NAME], [VERSION_NUM], [EMAIL_INFO], [PROJECT_NAME], [PROJECT_URL])
AC_CONFIG_SRCDIR([config.h.in])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([build-aux])

AM_INIT_AUTOMAKE([foreign -Wall -Werror])
AM_SILENT_RULES([yes])
AM_PROG_AR

LT_INIT

# check m4 macro
CHECK_PROJECT_INFO
CHECK_VERSION_INFO
CHECK_DOXYGEN

ENABLE_FEATURE_XXX
SELECT_FEATURE_XXX

# Checks for programs.
AC_PROG_CXX
AC_PROG_AWK
AC_PROG_CC
AC_PROG_CPP
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
# AC_PROG_RANLIB
AC_PROG_MKDIR_P

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile
                 $PACKAGE_NAME.pc
                 docs/Makefile
                 docs/plantuml/Makefile
                 example/Makefile
                 include/Makefile
                 include/sub_include/Makefile
                 res/Makefile
                 src/Makefile
                 src/sub_src/Makefile])
AC_OUTPUT
