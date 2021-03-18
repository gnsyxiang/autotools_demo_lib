#!/usr/bin/env bash

# set -x

TOP_DIR=..
m4_dir=${TOP_DIR}/m4
check_project_info=${m4_dir}/check_project_info.m4

get_project_name()
{
    libproject_url=`git remote -v | head -n1 | awk '{print $2}' | sed 's/git@/https:\/\//' | sed 's/com:/com\//'`
    libproject_name=`git remote -v | head -n1 | awk '{print $2}' | sed 's/.*\///' | sed 's/\.git//'`
    project_name=${libproject_name#*lib}
    project_name_2=${libproject_name%lib*}
    echo -e "\e[32m\tproject_name: $libproject_name \e[0m"

    mkdir -p ${m4_dir}

    echo    "m4_define([PROJECT_NAME], [$libproject_name])" >   ${check_project_info}
    echo    "m4_define([CHECK_PROJECT_INFO],"               >>  ${check_project_info}
    echo -e "\t\t  ["                                       >>  ${check_project_info}
    if [ x$project_name_2 = x ]; then
        echo -e "\t\t\tproject_name=$project_name"          >>  ${check_project_info}
    else
        echo -e "\t\t\tproject_name=$libproject_name"       >>  ${check_project_info}
    fi
    echo -e "\t\t\tAC_SUBST(project_name)"                  >>  ${check_project_info}
    echo -e "\t\t  ])"                                      >>  ${check_project_info}
    echo    "m4_define([EMAIL_INFO], [gnsyxiang@163.com])"  >>  ${check_project_info}
    echo    "m4_define([PROJECT_URL], [$libproject_url])"   >>  ${check_project_info}
}

get_full_version_num()
{
    if git describe --tags | sed s/-/_/g > version.num.tmp
    then
        mv version.num.tmp version.num
    else
        rm -rf version.num.tmp
    fi

    full_version=`tr -d '\n' < version.num`
    current=`cat version.num    | awk -F '_' '{print $1}' | awk -F '.' '{print $1}'`
    revision=`cat version.num   | awk -F '_' '{print $1}' | awk -F '.' '{print $2}'`
    age=`cat version.num        | awk -F '_' '{print $1}' | awk -F '.' '{print $3}'`

    echo -e "\e[32m\tfull_version: $full_version \e[0m"

    echo    "m4_define([VERSION_NUM], [$full_version])"     >>  ${check_project_info}
    echo    "m4_define([CHECK_VERSION_INFO],"               >>  ${check_project_info}
    echo -e "\t\t  ["                                       >>  ${check_project_info}
    echo -e "\t\t\tcurrent=$current"                        >>  ${check_project_info}
    echo -e "\t\t\trevision=$revision"                      >>  ${check_project_info}
    echo -e "\t\t\tage=$age"                                >>  ${check_project_info}
    echo -e "\t\t\tAC_SUBST(current)"                       >>  ${check_project_info}
    echo -e "\t\t\tAC_SUBST(revision)"                      >>  ${check_project_info}
    echo -e "\t\t\tAC_SUBST(age)"                           >>  ${check_project_info}
    echo -e "\t\t  ])"                                      >>  ${check_project_info}

    rm -rf version.num
}

echo "### get project name..."
get_project_name

echo "### get version num..."
get_full_version_num
