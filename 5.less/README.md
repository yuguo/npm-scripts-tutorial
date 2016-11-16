## 使用less

使用less自带的命令`lessc`代替`gulp-less`是很简单的。

在`gulp-less`的npm首页能够看到它的依赖是：

> Dependencies (6)
> vinyl-sourcemaps-apply, through2, object-assign, less, gulp-util, accord

因此，我们顺藤摸瓜找到了`lessc`，原来`lessc`是less语言官方自带的命令行工具，这样就简单了。

先安装

```
npm install lessc --save-dev
```

然后在`package.json`的`scripts`里加入：

```
styles: {
  "build:styles": "for i in less/*.less;do f=${i##*/}; lessc $i public/npmcss/${f%%.*}.css; break; done;"
}
```

这里看上去比较乱，拆解成sh文件就是：

```
#!/bin/bash

for i in less/*.less
do
  f=${i##*/}
  ./node_modules/less/bin/lessc $i public/npmcss/${f%%.*}.css
break
done
```

在`package.json`中不需要写完整的`lessc`路径，然后把换行全部用`;`来替换，就变成了上面的样子。

值得说明的是，我使用`for`循环来对每一个匹配的less文件进行单独操作，不过通过通配符取得的路径需要做一些处理，去掉目录和后缀，所以我使用了 **参数扩充（parameter expansion,）** 的功能。

```
i="path/index.less"
# f=="path/index"
f=${i%%.less}
# f2=="path/index"
f2=$(i%%.*)
# f3=="index"
f3=${f##*/}
```

参数扩充完整列表如下：

${parameter:-defaultValue}	| Get default shell variables value|
${parameter:=defaultValue}	| Set default shell variables value|
${parameter:?”Error Message”}	| Display an error message if parameter is not set|
${#var}	| Find the length of the string|
${var%pattern}	| Remove from shortest rear (end) pattern|
${var%%pattern}	| Remove from longest rear (end) pattern|
${var:num1:num2}	| Substring|
${var#pattern}	| Remove from shortest front pattern|
${var##pattern}	| Remove from longest front pattern|
${var/pattern/string}	| Find and replace (only replace first occurrence)|
${var//pattern/string}	| Find and replace all occurrences |