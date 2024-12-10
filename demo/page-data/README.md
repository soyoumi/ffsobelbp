

## 常见组件嵌套多页面交互
id:morepages

文本、输入框、图片，混合在界面上。<br/>
读写改查，不带sqlite3操作，带sqlite3操作见f2分支版本。<br/>
这个不带sqlite3操作，可以方便了解组件之间如何传递内容的，能够看明白一些。

##### 测试环境范围

≈ Flutter 3.24.5 <br/>
≈ Dart 3.5.4 <br/>
≈ gradle 8.6 <br/>
≈ Android SDK version 35.0.0 <br/>
≈ Java build 21.0.3+-12282718-b509.11 <br/>
≈ Windows 10 SDK version 10.0.19041.0 <br/>
≈ ndk 28.0.12674087

## yaml文件增添的配置

未增加配置

## dart导入库

所有导入的库<br/>
一是默认的 material.dart<br/>
二是：其它自写的代码页面dart文件。

请注意每个dart顶部可能导入一些库，留意 import xxx；

如 “import 'package:demo3/...” 中的 demo3 为项目名称id，yaml文件中顶部 name: 也是这个。

