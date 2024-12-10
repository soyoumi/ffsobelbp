

## 多页面跳转、传递数据、sqlite3

文本、输入框、图片，混合在界面上。<br/>
读写改查，可以方便了解组件之间如何传递内容的，带sqlite3操作。

## yaml文件增添的配置

未增加配置

## dart导入库

material.dart<br/>
其它自写页面dart文件。

## 遭遇到的问题障碍

朋友帮忙写这个实例的时候，sqlite3的问题，很不容易解决，弄了好久才解决了问题，这个过程中，有更换了sqlite3的操作代码，然后没安装ndk，进行了安装，后面还是没成功，或是手机问题，后来在电脑上使用模拟器成功了，再换手机上也成功了。

请留意这个带sqlite3操作的，我这里是改了ndk版本的设置，因为出现了ndk版本不适配的问题。

如果编译出现错误，尝试按照以下更改，ndk版本要改成你那里的版本，怎么查看ndk版本，Android Studio 那里查看sdk的界面就能看到。

G:\flutterxx\demo\android\app\build.gradle
下的配置

```android {
    namespace = "com.example.demo"
    compileSdk = flutter.compileSdkVersion
    //ndkVersion = flutter.ndkVersion
    ndkVersion = "28.0.12674087"
```
将ndkVersion版本改成输入的版本号了。

