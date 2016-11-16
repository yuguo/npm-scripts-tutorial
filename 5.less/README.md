## 使用less

使用npm scripts代替`gulp-less`是很简单的。

在`gulp-less`的npm首页能够看到它的依赖有6个：

> Dependencies (6)
>
> vinyl-sourcemaps-apply, through2, object-assign, less, gulp-util, accord

因此，我们顺藤摸瓜找到了`less`，看上去只有它是做真正的处理工作的，其它只是辅助。

在[less官网](http://lesscss.org/usage/)可以看到，原来`lessc`是less语言官方自带的命令行工具，这样就简单了。

先安装（推荐使用这种方式，因为通过package.json管理开发依赖，其他人在安装时不会漏）

```
npm install less --save-dev
```

或者

```
npm install less -g
```

然后在`package.json`的`scripts`里加入：

```
styles: {
  "build:styles": "for i in less/*.less;do f=${i##*/}; lessc $i public/npmcss/${f%%.*}.css; break; done;"
}
```

就可以通过

```
npm run build:styles
```

来编译less文件了！

### 分析拆解

单行脚本看上去比较乱，我们拆解成sh文件就是：

```
#!/bin/bash

for i in less/*.less
do
  f=${i##*/}
  ./node_modules/less/bin/lessc $i public/npmcss/${f%%.*}.css
break
done
```

1. 在`package.json`中不需要写完整的`lessc`路径，直接运行`lessc`即可；
2. 把换行全部用`;`来替换。

就变成了上面的样子。

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

| ${parameter:-defaultValue}	| Get default shell variables value|
| ${parameter:=defaultValue}	| Set default shell variables value|
| ${parameter:?”Error Message”}	| Display an error message if parameter is not set|
| ${#var}	| Find the length of the string|
| ${var%pattern}	| Remove from shortest rear (end) pattern|
| ${var%%pattern}	| Remove from longest rear (end) pattern|
| ${var:num1:num2}	| Substring|
| ${var#pattern}	| Remove from shortest front pattern|
| ${var##pattern}	| Remove from longest front pattern|
| ${var/pattern/string}	| Find and replace (only replace first occurrence)|
| ${var//pattern/string}	| Find and replace all occurrences |