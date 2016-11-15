## shell编程

shell 脚本是一个比较小的语言规范，所以容易学习。

### 注释

```
#!/bin/bash
# 注释
```

### varible

```
#!/bin/bash
num1=1
num2=2
echo $num1
echo $num2
echo $((num1 + num2))
echo $((num1 - num2))
echo $((num1 * num2))
echo $((num1 / num2))
```

### cat

```
#!/bin/bash
cat<< END
hello
this is a
long
sentence.
END
```

### <<

```
[N]<<[-]WORD
```

`<<`命令会引导shell读取接下来的文件内容，并作为输入给到[N]程序（如果指定了的话）。如果没有指定[N]，就相当于标准输入了。

当接下来的文件内容中某一行等于WORD时（不能有多余的空格），输入结束。

### 函数

函数的声明比较简单，需要注意的是返回值用`echo`，而不是`return`。

还有，调用函数不需要括号，而是使用空格来传递参数。

```
#!/bin/bash

function getSum(){
  local num4=$1
  local num5=$2
  local sum=$((num4+num5))
  echo $sum
}

num1=5
num2=6
num3=$(getSum num1 num2)
echo "$num3"
```
### if...then...else...fi

if.sh
