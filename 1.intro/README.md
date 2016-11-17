## 开始之前

开始之前，希望你已经阅读了阮一峰老师的[npm scripts 使用指南](http://www.ruanyifeng.com/blog/2016/10/npm_scripts.html)，了解了关于 npm scripts 的基本知识。

本项目专注于实战和一些细节。

## 了解`package.json`

在一个新建的目录中，我们运行`npm init`并点击若干次回车键之后就生成了一个默认的最简单的 npm包，官方叫做 package 或者 module。

所谓 npm包 就是一个`package.json`文件和若干代码来组成。

`package.json`给 npm 提供了这个包的基本信息，比如`name`，`description`,`author`,`version`,`license`等。

此外还提供了告知 npm 如何处理这个包的信息，比如`main`定义了整个包的入口文件，`scripts`则更加重要，定义了可以让 npm 来运行的操作。

## `scripts`是什么？

```
"scripts": {
  "test": "echo \"Error: no test specified\" && exit 1"
},
```

这段代码的意思是，当在命令行中运行

```
npm run test
```

的时候，就几乎等同于运行

```
echo \"Error: no test specified\" && exit 1
```

这些定义在`package.json`里面的脚本，就称为 npm 脚本。它有很多好处：

* 项目的相关脚本，可以集中在一个地方。
* 不同项目的脚本命令，只要功能相同，就可以有同样的对外接口。特别是一些标准操作，比如`npm test`就被很多自动测试软件调用。
* 可以利用 npm 提供的信息和辅助功能。
* 可以调用任意的 npm 包，比起 gulp 或 grunt 等任务构建工具能够使用更多的包，效率也更高。

npm 脚本会使用当前系统的 shell 来运行，在 linux、OS X 中，就是 Bash。

## 小试牛刀

试着运行一下`npm run test`，会发现命令行给出了错误：

```
> 1.test@1.0.0 test /Users/yuguo/Sites/npm-scripts-tutorial/1.intro
> echo "Error: no test specified" && exit 1

Error: no test specified

npm ERR! Darwin 16.3.0
npm ERR! argv "/usr/local/bin/node" "/usr/local/bin/npm" "run" "test"
npm ERR! node v7.0.0
npm ERR! npm  v3.10.8
npm ERR! code ELIFECYCLE
npm ERR! 1.test@1.0.0 test: `echo "Error: no test specified" && exit 1`
npm ERR! Exit status 1
npm ERR!
npm ERR! Failed at the 1.test@1.0.0 test script 'echo "Error: no test specified" && exit 1'.
```

第1行给出了运行这句命令的包名称、脚本命令、和路径。

第2行给出了脚本的内容。

第4行打印出了`echo`打印的内容。

第6行后面的所有内容都是报错相关信息，因为我们用了 `exit 1`来结尾，所以 npm 认为我们的脚本没有运行成功。

与此同时，应该能够在当前目录看到生成了一个 `npm-debug.log` 文件，记录了错误的log文件，每次运行`npm run`都会清除旧的 `npm-debug.log`文件，如果有新的错误产生，会重新生成。

## 什么是 exit status 1

`exit` 命令会终结一段 Bash 脚本（就像C语言里面一样），并且可选返回一个数字，来告诉调用它的父程序自己的运行状况。

运行成功的命令会返回 0，不成功的命令会返回一个非0的数字，叫做exit status。

所以，npm 默认生成的这段测试脚本就是警告未配置测试代码，然后`exit 1`了。

试着把test脚本改成如下再试试？

```
"scripts": {
  "test": "echo \"Pass the test!\" && exit 0"
},
```

现在系统显示如下：

```

> 1.test@1.0.0 test /Users/yuguo/Sites/npm-scripts-tutorial/1.intro
> echo "Pass the test!" && exit 0

Pass the test!
```

## 简写

npm 提供了一些简写方式，比如`npm test`，`npm start`，`npm stop`等。

`npm test`就是`npm run test`的简写。

简写有两个好处

1. 常用命令，输入更方便
2. 一致的标准接口，让 npm 可以更加方便地开始和停止一个项目，或者测试一个项目。一些持续集成工具，比如Travis，就使用了这个特征，它会调用默认脚本`npm test`来进行测试