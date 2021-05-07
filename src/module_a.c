/**
 * 
 * Release under GPLv-3.0.
 * 
 * @file    module_a.c
 * @brief   
 * @author  gnsyxiang <gnsyxiang@163.com>
 * @date    05/03 2021 10:46
 * @version v0.0.1
 * 
 * @since    note
 * @note     note
 * 
 *     change log:
 *     NO.     Author              Date            Modified
 *     00      zhenquan.qiu        05/03 2021      create the file
 * 
 *     last modified: 05/03 2021 10:46
 */
#include <stdio.h>

#include "config.h"

#include "module_a.h"
#include "sub_include/module_b_inter.h"

void HyModuleAInit(void)
{
    module_b_func();

#ifdef HAVE_SELECT_FEATURE_XXX_A
    printf("select feature xxx a\n");
#endif

    printf("module a init successful \n");
}

void HyModuleADeInit(void)
{
    printf("module a deinit successful \n");
}
