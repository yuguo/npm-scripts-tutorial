## 处理JavaScript

处理JavaScript分为两个步骤，第一步先进行lint。

常用的有`jslint`和`jshint`，不过现在更流行可配置的`ESLint`。

### lint

```
"prebuild:scripts": "eslint assets/scripts/main.js"
```

### 合并&混淆

```
"build:scripts": "browserify assets/scripts/main.js | uglifyjs - > public/main.min.js"
```

