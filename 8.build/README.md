## 合并整个构建过程

我们已经有了 `build:styles` 和 `build:scripts` ，想要通过一个命令同时完成两个命令，我们需要使用 `&&`。

```
"build:scripts": "browserify assets/scripts/main.js | uglifyjs - > public/main.min.js",
"prebuild:scripts": "eslint assets/scripts/main.js",
"build:styles": "for i in `ls less/**/*.less`;do f=${i#*/}; lessc $i public/npmcss/${f%%.*}.css; break; done;",
"build": "npm run build:scripts -s && npm run build:styles -s"
```