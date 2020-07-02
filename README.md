# two_you_friend

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 第四课 编程规范工具

------
### 命名规范
    1. 大写驼峰 AaBa 用于类
    2. 小写驼峰 aaBa 用于常量和变量
    3. 带下划线 aa_bb 用于文件名
-----
### 注释
     //  单行注释 解释说明 对于单行代码逻辑进行解释， 为了避免过多注释，主要是在一些理解较为复杂带代码逻辑上进行注释
    /// 三个斜杠注释 多行注释 类注释，类的作用 参数 函数注释 参数 返回数据补充说明 **推荐**
    /*......*/ /**........*/ 多行注释 块注释其它语言比较常用，如JavaScript
    
    /// App首页入口
    ///
    /// 本模块函数， 加载状态类组件HomePageState
    class HomePage extends StatefulWidget {
        _HomagePageState createState() => _HomagePageState();
    }
    
    /// 首页有状态组件类
    ///
    /// 主要是获取当前时间， 并动态展示当前时间
    class _HomagePageState extends State<HomagePage> {
    
        /// 获取当前时间戳
        ///
        /// [prefix]需要传入一个前缀信息
        /// 返回一个字符串类型的前缀信息: 时间戳
        String getCurrentTime(String prefix) {  }
        
        /// 有状态类返回组件信息
        @override
        Widget builder(BuilderContext context) {
        
        }
    }
    
### 库引入规范
    库引入顺序 为了代码整洁， flutter对库对引入做了规范   每个部分空行分割
    1. dart  第一部分dart库
    2. package库
    3. 未带协议头对库
    
    import 'dart:developer';
    
    import 'package:flutter/material.dart';
    import 'package:two_you_friend/pages/home_page.dart';
    
    import 'util.dart'
### 工具
    
     1. 注释文档生成工具 **dartdoc**
     2. 代码美化 dartfmt -h
        1. 使用空格而不是tab
        2. 在一个完整对代码逻辑后面使用空行区分
        3. 二元或者三元运算符之间使用空格
        4. 在关键词,和;之后使用空格
        5. 一元运算符后请勿使用空格
        6. 在流控制关键词 如for和while后， 使用空格区分
        7. 在([{}])符号后请勿使用空格
        8. 在 { 后面使用空格
        9. 使用.操作符， 从第二个.符号后每次都使用新的一行
        dart -w --fix lib/
        [参考官网地址](https://github.com/dart-lang/dart_style/wiki/Formatting-Rules)
        
### 规范格式要求
    #### dartanalyzer 保证代码质量 该工具也集成在dart SDK中
    使用：
    1. 在dart项目根目录新增 **analysis_options.yaml**文件
    2. 然后在文件中按照规范填写你需要执行的规则简称即可
    3. 现有规范检查可以参考[Dart linter rules](https://dart-lang.github.io/linter/lints/)规范
    
    #### 第三方库 配置好的规范模版
    1.  pedantic  effective_dart
    2. 在当前项目的.pubSpec.yaml配置好后  运行 flutter pub upgrade
    3. 在本地新增的   **analysis_options.yaml**文件 新增如下配置
    4. include: package:pedantic/analysis_options.1.8.0.yaml
    5. 还可以在**analysis_options.yaml**文件中根据自己需要去配置
    6. 运行 **dartanalyzer lib**去检查