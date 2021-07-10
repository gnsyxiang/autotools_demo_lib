# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    Makefile.am
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    05/03 2021 10:35
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        05/03 2021      create the file
# 
#     last modified: 05/03 2021 10:35
# ===============================================================

SUBDIRS = sub_src

lib_LTLIBRARIES = lib@project_name@.la

# ------------------
# defining variables
# ------------------
_include_com    =
_sources_com    =
_cppflags_com   =
_cflags_com     =
_cxxflags_com   =
_ldflags_com    =
_ldadd_com      =

# ---------------------
# add necessary content
# ---------------------
_include_com    += -I$(top_srcdir)/include

_sources_com    += module_a.c

if COMPILE_SELECT_FEATURE_XXX_A
_sources_com    +=
endif

_cppflags_com   += \
                   $(CPPFLAGS_COM) \
                   $(_include_com)

_cflags_com     += $(CFLAGS_COM)

_cxxflags_com   += $(CXXFLAGS_COM)

# 导出函数列表方法：
# 1，直接添加__attribute__((visibility("hidden")))到函数上
# 2，在CFLAG中添加-fvisibility=hidden参数，全部不导出，然后配合EXPORT_FUNC导出需要导出的函数
# 3，通过文件指定需要导出的函数，
#    在gcc中添加参数(两种实现方式): "-Wl,-version-script -Wl,.libs/autotools_demo_lib.ver"
#                                   "-Wl,--version-script=.libs/autotools_demo_lib.ver"
#  cat autotools_demo_lib.ver
#  { global:
#  Hal_strlen;
#  Hal_strncpy;
#  local: *; };
# 4, 通过libtool导出函数列表，如下参数
_ldflags_com    += -export-symbols-regex 'Hy*'

# 1, 版本命名规则 
#    1>  libtool动态库的版本由三个字段组成current:revision:age
#        * 修改规则: 
#              * 动态库的版本应该开始于0:0:0
#              * 如果library的源码发生了变动(指bug修复，性能的提升，某些功能的重构等)，则revision加1。
#              * 如果library的接口发生了任何改动(增加，删除，参数或返回值变动)，则current加1，revision置0
#              * 如果library只是增加了接口，则age加1
#              * 如果library的接口被删除或参数返回值发生变动， 则将age置0
#        * 简单总结:
#              * current为当前接口改动的次数(接口的任何改动，该位都需要加1)
#              * revision为上次接口改变后源码修改（不改动接口）的次数
#              * age为当前版本向前兼容的版本数
#        * 生成的库版本规则, 比如: [3:12:1]
#              表示该library的接口改动了3次， 第3次接口改动后修改了12次源码，该版本的library兼容依赖于current=2（3-1）版本library的程序。
#              将该库进行编译后，会发现库的名字为libraryname.so.2.1.12， 即编译产生的库名为libraryname.so.c-a.a.r。
#              表示该library对于依赖于current=c-a(libraryname.so.2)到current=c(libraryname.so.3)的程序都是可用的， 运行时不会出现任何异常。
#    2> libxxx.so.x.y.z
#       * x: 主版本号
#             表示共享库的重大升级，很多时候不同主版本号之间的库是互相不兼容的，
#             因为某些接口可能已经被修改，而旧的接口没有保留。这样的话，
#             如果那些依赖于旧版本的程序可能需要重新编译，或者系统保留旧版本的库才行。
#       * y: 次版本号
#             表示库增量式升级，通常也就是增加一些新的接口，而原来的库符号则保留不变，
#             保证兼容，因此如果是次版本号的升级不会导致系统中的某些程序无法运行的情况
#       * y: 发布版本号
#             表示库的一些bug修正，性能的提升改进的升级，通常不会添加任何接口，也不会对任何接口进行修改。
#
#       * 因此通常来讲，
#             相同主版本号，相同次版本号，不同发布版本号之间的库是完全兼容的;
#             相同主版本号，不同次版本号之间也是兼容的。
#
# 2, 动态库说明: <autotools_demo_lib.so.1.2.23>
#
#    * 共享库本身的文件名 (real name) --> autotools_demo_lib.so.1.2.23
#          该文件是包含数据的正真动态库
#
#    * 共享库的soname (Short for shared object name) --> autotools_demo_lib.so.1
#          该文件是编译进应用程序的动态库，应用程序通过查找该文件来获取库里面的信息，
#          进而实现在不需要编译的情况下，soname指向不同的动态库来实现升级
#
#    * 共享库的链接名 (link name) --> autotools_demo_lib.so
#          应用程序链接需要的动态库, 方便不需要修改编译配置即可编译程序
#
# 3, 编译链接时，查找顺序
#    * /usr/local/lib
#    * /usr/lib
#    * 用-L指定的路径，按命令行里面的顺序依次查找
#
# 4, 运行加载时的顺序
#    * 可执行程序指定的的DT_RPATH
#    * LD_LIBRARY_PATH. 但是如果使用了setuid/setgid，由于安全因素，此路径将被忽略.
#    * 可执行程序指定的的DT_RUNPATH. 但是如果使用了setuid/setgid，由于安全因素，此路径将被忽略
#    * /etc/ld/so/cache. 如果链接时指定了‘-z nodeflib’，此路径将被忽略.
#    * /lib. 如果链接时指定了‘-z nodeflib’，此路径将被忽略
#    * /usr/lib. 如果链接时指定了‘-z nodeflib’，此路径将被忽略
#
# 5, 编译/链接/程序执行，定位动态库找不到的工具
#    * nm: 查看共享库暴露的接口
#    * ldconfig: 可以自动生成soname的链接接文件。并更新共享库的搜索cache，加速查找。
#    * readelf: 可以查看动态库的信息，本身的soname。
#    * ldd: 可以查看应用程序或共享库依赖的库
# 表示该library对于依赖于current=c-a(libraryname.so.2)到current=c(libraryname.so.3)的程序都是可用的， 运行时不会出现任何异常。
_ldflags_com    += -version-info @current@:@revision@:@age@

_ldflags_com    += $(LIB_LDFLAGS_COM)

_ldadd_com      += $(top_builddir)/src/sub_src/libmodule_b.la

lib@project_name@_la_SOURCES    = $(_sources_com)
lib@project_name@_la_CPPFLAGS   = $(_cppflags_com)
lib@project_name@_la_CFLAGS     = $(_cflags_com)
lib@project_name@_la_CXXFLAGS   = $(_cxxflags_com)
lib@project_name@_la_LDFLAGS    = $(_ldflags_com)
lib@project_name@_la_LIBADD     = $(_ldadd_com)

