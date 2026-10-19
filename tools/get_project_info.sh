#!/usr/bin/env bash

# set -x

TOP_DIR=..
m4_dir=${TOP_DIR}/m4
check_project_info=${m4_dir}/check_project_info.m4

version_file=
PROJECT_NAME=

get_project_name()
{
    libproject_name=$1
    libproject_url=$2

    LIBPROJECT_NAME=$(echo "$libproject_name" | tr '[:lower:]' '[:upper:]')

    project_name=${libproject_name#*lib}
    project_name_2=${libproject_name%lib*}
    echo -e "\e[32m\tproject_name: $libproject_name \e[0m"

    version_in_file="../include/$project_name/${project_name}_version.h.in"
    version_file="../include/$project_name/${project_name}_version.h"
    PROJECT_NAME=$(echo "$project_name" | tr '[:lower:]' '[:upper:]')

    # 如果 .in 模板文件不存在，则生成一个默认模板
    if [ ! -f "$version_in_file" ]; then
        echo "Creating template file: $version_in_file"

        mkdir -p "$(dirname "$version_in_file")"  # 确保目录存在

        cat > "$version_in_file" <<EOF
/**
 *
 * Release under GPLv-3.0.
 * 
 * @file    ${project_name}_version.h
 * @brief   
 * @author  gnsyxiang <gnsyxiang@163.com>
 * @date    08/14 2026 10:46
 * @version v0.0.1
 * 
 * @since    note
 * @note     note
 * 
 *     change log:
 *     NO.     Author              Date            Modified
 *     00      zhenquan.qiu        08/14 2026      create the file
 * 
 *     last modified: 08/14 2026 10:46
 */
#ifndef __${LIBPROJECT_NAME}_INCLUDE_${PROJECT_NAME}_VERSION_H_
#define __${LIBPROJECT_NAME}_INCLUDE_${PROJECT_NAME}_VERSION_H_

#ifdef __cplusplus
extern "C" {
#endif

#define ${PROJECT_NAME}_VERSION_CURRENT         1
#define ${PROJECT_NAME}_VERSION_REVISION        0
#define ${PROJECT_NAME}_VERSION_AGE             0

#define ${PROJECT_NAME}_VERSION_NUM             0

#define ${PROJECT_NAME}_VERSION_IS_RELEASE      1
#define ${PROJECT_NAME}_VERSION_PREFIX          ""
#define ${PROJECT_NAME}_VERSION_SUFFIX          ""

#define ${PROJECT_NAME}_VERSION_MAJOR           (${PROJECT_NAME}_VERSION_CURRENT - ${PROJECT_NAME}_VERSION_AGE)
#define ${PROJECT_NAME}_VERSION_MINOR           (${PROJECT_NAME}_VERSION_AGE)
#define ${PROJECT_NAME}_VERSION_PATCH           (${PROJECT_NAME}_VERSION_REVISION)

#define ${PROJECT_NAME}_VERSION_HEX                 \\
    ((${PROJECT_NAME}_VERSION_MAJOR * 1000000) +    \\
    (${PROJECT_NAME}_VERSION_MINOR * 10000)    +    \\
    (${PROJECT_NAME}_VERSION_PATCH * 100)      +    \\
    (${PROJECT_NAME}_VERSION_NUM))

#ifdef __cplusplus
}
#endif

#endif

EOF
    fi

    cp "$version_in_file" "$version_file"

    mkdir -p ${m4_dir}

    echo    "m4_define([PROJECT_NAME], [$libproject_name])"     >   ${check_project_info}
    echo    "m4_define([CHECK_PROJECT_INFO],"                   >>  ${check_project_info}
    echo -e "\t\t  ["                                           >>  ${check_project_info}
    if [ x"$project_name_2" = x ]; then
        echo -e "\t\t\tproject_name=$project_name"              >>  ${check_project_info}
    else
        echo -e "\t\t\tproject_name=$libproject_name"           >>  ${check_project_info}
    fi
    echo -e "\t\t\tAC_SUBST(project_name)"                      >>  ${check_project_info}
    echo -e "\t\t  ])"                                          >>  ${check_project_info}
    echo    "m4_define([EMAIL_INFO], [gnsyxiang@163.com])"      >>  ${check_project_info}
    echo    "m4_define([PROJECT_URL], [$libproject_url])"       >>  ${check_project_info}
}

get_full_version_num()
{
    full_version_branch=$1
    full_version=$2

    current=$(echo "$full_version"      | awk -F '_' '{print $1}' | awk -F '.' '{print $1}')
    revision=$(echo "$full_version"     | awk -F '_' '{print $1}' | awk -F '.' '{print $2}')
    age=$(echo "$full_version"          | awk -F '_' '{print $1}' | awk -F '.' '{print $3}')

    is_release=$3
    num=$4
    prefix=$5
    suffix=$6

    sed -i "s/^#define ${PROJECT_NAME}_VERSION_CURRENT[[:space:]]*[0-9]*$/#define ${PROJECT_NAME}_VERSION_CURRENT $current/"          "$version_file"
    sed -i "s/^#define ${PROJECT_NAME}_VERSION_REVISION[[:space:]]*[0-9]*$/#define ${PROJECT_NAME}_VERSION_REVISION $revision/"       "$version_file"
    sed -i "s/^#define ${PROJECT_NAME}_VERSION_AGE[[:space:]]*[0-9]*$/#define ${PROJECT_NAME}_VERSION_AGE $age/"                      "$version_file"

    sed -i "s/^#define ${PROJECT_NAME}_VERSION_NUM[[:space:]]*[0-9]*$/#define ${PROJECT_NAME}_VERSION_NUM $num/"                      "$version_file"

    sed -i "s/^#define ${PROJECT_NAME}_VERSION_IS_RELEASE[[:space:]]*[0-9]*$/#define ${PROJECT_NAME}_VERSION_IS_RELEASE $is_release/" "$version_file"
    sed -i "s/^#define ${PROJECT_NAME}_VERSION_PREFIX[[:space:]]*\".*\"$/#define ${PROJECT_NAME}_VERSION_PREFIX \"$prefix\"/"         "$version_file"
    sed -i "s/^#define ${PROJECT_NAME}_VERSION_SUFFIX[[:space:]]*\".*\"$/#define ${PROJECT_NAME}_VERSION_SUFFIX \"$suffix\"/"         "$version_file"

    echo -e "\e[32m\tfull_version: $full_version_branch \e[0m"

    echo    "m4_define([VERSION_NUM], [$full_version_branch])"  >>  ${check_project_info}
    echo    "m4_define([CHECK_VERSION_INFO],"                   >>  ${check_project_info}
    echo -e "\t\t  ["                                           >>  ${check_project_info}
    echo -e "\t\t\tcurrent=$current"                            >>  ${check_project_info}
    echo -e "\t\t\trevision=$revision"                          >>  ${check_project_info}
    echo -e "\t\t\tage=$age"                                    >>  ${check_project_info}
    echo -e "\t\t\tAC_SUBST(current)"                           >>  ${check_project_info}
    echo -e "\t\t\tAC_SUBST(revision)"                          >>  ${check_project_info}
    echo -e "\t\t\tAC_SUBST(age)"                               >>  ${check_project_info}
    echo -e "\t\t  ])"                                          >>  ${check_project_info}
}

if [[ -d $TOP_DIR/.git ]]; then
    echo "### get project name..."

    libproject_url=$(git remote -v | head -n1 | awk '{print $2}' | sed 's/git@/https:\/\//' | sed 's/com:/com\//')
    libproject_name=$(git remote -v | head -n1 | awk '{print $2}' | sed 's/.*\///' | sed 's/\.git//')

    get_project_name "$libproject_name" "$libproject_url"


    echo "### get version num..."
    branch_name=$(git branch --show-current)
    branch_name_new=$(echo "$branch_name" | sed 's/\//_/' | sed 's/-/_/g')

    project_version=$(git describe --tags)
    project_version_new=$(git describe --tags | sed s/-/_/g)

    version_hash=$(echo "$project_version" | cut -d'-' -f2-)
    version_hash_new=$(echo "$version_hash" | sed 's/\//_/' | sed 's/-/_/g')

    version_num=$(echo "$project_version" | awk -F'-' '
    {
        if (NF >= 2 && $2 ~ /^[0-9]+$/) {
            print $2
        } else {
            print 0
        }
    }')

    if [[ "$branch_name_new"x = "main"x || "$branch_name_new"x = "master"x || $branch_name_new =~ release_[0-9]+\.[0-9]+\.x ]]; then
        get_full_version_num "$project_version_new" "$project_version_new" 1 0 "" ""
    else
        get_full_version_num "$branch_name_new"-"$project_version_new" "$project_version_new" 0 "$version_num" "$branch_name_new" "$version_hash_new"
    fi
else
    echo "### get project name..."
    project_path=$(pwd)
    project_path_left=${project_path%/*}
    project_path_right=${project_path_left##*/}

    project_name=${project_path_right%-*}

    get_project_name "$project_name"

    echo "### get version num..."
    project_version=${project_path_right##*-}

    get_full_version_num "$project_version"
fi

