/**
 * 
 * Release under GPLv-3.0.
 * 
 * @file    main.c
 * @brief   
 * @author  gnsyxiang <gnsyxiang@163.com>
 * @date    05/03 2021 10:20
 * @version v0.0.1
 * 
 * @since    note
 * @note     note
 * 
 *     change log:
 *     NO.     Author              Date            Modified
 *     00      zhenquan.qiu        05/03 2021      create the file
 * 
 *     last modified: 05/03 2021 10:20
 */
#include <stdio.h>

#include "module_a.h"
#include "sub_include/module_b.h"

int main(int argc, char const* argv[])
{
    printf("hello world \n");

    HyModuleAInit();
    HyModuleBInit();

    return 0;
}
