/**
 * 
 * Release under GPLv-3.0.
 * 
 * @file    aaa.c
 * @brief   
 * @author  gnsyxiang <gnsyxiang@163.com>
 * @date    05/03 2021 17:10
 * @version v0.0.1
 * 
 * @since    note
 * @note     note
 * 
 *     change log:
 *     NO.     Author              Date            Modified
 *     00      zhenquan.qiu        05/03 2021      create the file
 * 
 *     last modified: 05/03 2021 17:10
 */
#include <stdio.h>

#include "sub_include/module_b.h"

void HyModuleBInit(void)
{
    printf("module b init successful \n");
}

void module_b_func(void)
{
    printf("module b func \n");
}
