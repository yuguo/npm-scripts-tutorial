## 流（stream）

Gulp能够比Grunt更流行的一个原因就是它使用了linux里面的流的概念。

使用流可以让一个文件的输出直接变成另一个文件的输入，而无需把输出存放在一个临时文件中。通过这种方式，既简单（无需清理），又快速（免除文件IO的时间），所以是处理工作流的最佳实践。

Substack 专门写了一个[stream handbook](https://github.com/substack/stream-handbook)，推荐阅读。

### npm script中使用流

在bash或者windows的命令行工具中可以用`|`符号来把一个命令的输出（stdout）直接对接到另一个命令的输入中（stdin）。