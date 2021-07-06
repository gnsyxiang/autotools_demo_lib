# README

## 依赖

* `autotools`

需要安装`autotools`工具，执行`sudo apt install -y autoconf`

* `java`

因为使用了`plantuml`脚本开发相关时序图，并且[`plantuml.jar`](docs/plantuml/plantuml.jar)程序把脚本转换为`svg`图片的过程中需要用到`java`运行环境。

* `doxygen`

如果需要生成`html`文档，需要安装`doxygen`软件，把相关注释转化成文档。执行`sudo apt install -y doxygen`

* `graphviz`

如果需要生成`html`文档中的调用图，需要安装`graphviz`软件，把函数调用通过图形的方式展示出来，并可以通过图形跳转。执行`sudo apt install -y graphviz`


## 使用说明

* 执行`./autogen.sh`，生成`configure`脚本

* 三部曲编译源码并生成对应文件

```shell
$ ./configure
$ make
$ make install
```

## 配置相关选项

* `--prefix=PREFIX`: 指定安装路径

* `--enable-doxygen-doc`: 生成html帮助文档

* `--enable-feature-xxx`: 编译`feature-xxx`功能

* `--with-feature-xxx=a/b/c`: 选择三者中的一个编译

