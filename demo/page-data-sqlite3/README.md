

## 常见组件嵌套多页面交互
id:morepages

文本、输入框、图片，混合在界面上。<br/>
读写改查，带结合sqlite3操作

##### 测试环境范围

≈ Flutter 3.24.5 <br/>
≈ Dart 3.5.4 <br/>
≈ gradle 8.6<br/>
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

## 遭遇到的问题障碍

朋友帮忙写这个实例的时候，sqlite3的问题，很不容易解决，弄了好久才解决了问题，这个过程中，有更换了sqlite3的操作代码，然后没安装ndk，进行了安装，后面还是没成功，或是手机问题，后来在电脑上使用模拟器成功了，再换手机上也成功了。

请留意这个带sqlite3操作的，我这里是改了ndk版本的设置，因为出现了ndk版本不适配的问题。

G:\flutterxx\demo\android\app\build.gradle
下的配置

```android {
    namespace = "com.example.demo"
    compileSdk = flutter.compileSdkVersion
    //ndkVersion = flutter.ndkVersion
    ndkVersion = "28.0.12674087"
```
将ndkVersion版本改成输入的版本号了。

