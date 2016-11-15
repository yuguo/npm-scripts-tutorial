npm scripts实际上是在当前操作系统的shell中运行一段命令，而在Linux，Solaris，BSD和Mac OSX系统中，都安装了 Bash 作为默认 shell，所以掌握 Bash 编程是使用npm scripts的基础。

## 直接在shell中输入

直接输入`echo Hello World`，就能看到终端显示了`Hello World`。

## 通过文件调用

第二种方式是通过文件调用，在当前目录创建一个文件`hello.sh`，输入：

```
#!/bin/bash          
echo Hello World  
```

这个文件第一行告诉操作系统，使用什么程序来运行这段脚本。

第二行就是文件正文，会把`Hello World`输出到终端。

### 什么是`sh`和`bash`？

`sh`（又叫Shell Command Language）是一种编程语言规范，它有很多实现，比如`ksh88`，`dash`等。

`bash`也是`sh`的一种实现，不过后续也增加了很多新的扩展，准确讲它是`sh`的一门“方言”。

因为`sh`是一个规范而不是一个实现，所以`/bin/sh`会指向一个实际的语言实现（通过syslink或者hard link）。

在大部分GNU/Linux系统中，`/bin/sh`指向`/bin/bash`。

所以如果我们在文件第一行写

```
#!/bin/sh
```

就等于听天由命看系统的`sh`指向哪里（在现代的Debian和Ubuntu里面默认是`dash`）。

如果我们写

```
#!/bin/bash
```

就会去直接寻找bash，如果没有bash就报错。

### 权限问题

如果系统提示：

```
permission denied: ./hello.sh
```

说明当前用户没有执行这个脚本的权限，解决方法是使用`chmod`：

```
chmod +x hello.sh
```

### 找不到Bash

如果提示

```
./hello.sh: Command not found
```

先检查有没有拼写错误，如果拼写正确，再试试`whereis bash`来定位到 Bash 正确的位置。

## 创建目录

```
mkdir foo
```

会创建一个名为`foo`的文件夹

## 创建文件

```
touch 1.txt
```

会生成一个`1.txt`文件。

那么想创建一百个文件怎么办呢？

```
touch {1..100}.txt
```

## 移除文件和文件夹

```
rm foo
rm -r folder
rm -f folder
```

