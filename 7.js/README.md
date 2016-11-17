## 处理JavaScript

处理JavaScript分为两个步骤，第一步先进行lint。

常用的有`jslint`和`jshint`，不过现在更流行可配置的`ESLint`。

### lint

```
"prebuild:scripts": "eslint assets/scripts/main.js"
```

`eslint`的使用方法比较简单，参考官方文档即可：

[eslint官方文档](https://www.npmjs.com/package/eslint)

### 合并&混淆

```
"build:scripts": "browserify assets/scripts/main.js | uglifyjs - > public/main.min.js"
```

[uglifyjs官方文档](https://www.npmjs.com/package/uglify)

