# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    check_pthread.m4
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    27/09 2025 11:57
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        27/09 2025      create the file
# 
#     last modified: 27/09 2025 11:57
# ===============================================================

AC_DEFUN([CHECK_PTHREAD],
    [
        have_pthread_setname_np=no

        # clear cache
        unset ac_cv_search_pthread_setname_np
        AC_SEARCH_LIBS([pthread_setname_np],
            [pthread],
            [have_pthread_setname_np=yes],
            [have_pthread_setname_np=no],
            [])

        case "$have_pthread_setname_np" in
            yes)
                AC_DEFINE(HAVE_PTHREAD_SETNAME_NP, 1, [Define if the pthread has pthread_setname_np])
            ;;
            *)
                AC_MSG_WARN([don't have pthread_setname_np])
            ;;
        esac
    ])

