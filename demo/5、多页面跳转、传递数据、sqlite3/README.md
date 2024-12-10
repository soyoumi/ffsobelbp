

## 多页面跳转、传递数据、sqlite3

文本、输入框、图片，混合在界面上。<br/>
读写改查，可以方便了解组件之间如何传递内容的，带sqlite3操作。

## yaml文件增添的配置

yaml文件找到以下位置

```
dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.8
```

在下面添加以下配置

```
  sqlite3: ^2.5.0
  sqlite3_flutter_libs: ^0.5.20
  path_provider: ^2.1.5
  path: ^1.9.0
```

添加完成后，点击右上角下载依赖包即可。

## dart导入库

material.dart<br/>
其它自写页面dart文件。

## 遭遇到的问题障碍

朋友帮忙写这个实例的时候，sqlite3的问题，很不容易解决，弄了好久才解决了问题，这个过程中，有更换了sqlite3的操作代码，然后没安装ndk，进行了安装，后面还是没成功，或是手机问题，后来在电脑上使用模拟器成功了，再换手机上也成功了。

最后多次尝试后发现，必须修改这3处地方，而且要和以下版本非常临近才行。

gradle 好像不能低于8.6、ndk可能不能低于28太多、com.android.application可能不能低于8.4.2太多，7版本估计都不行，org.jetbrains.kotlin.android 估计不能低于2.0，具体见以下修改，测试通过，能够正常编译调试windows应用、安卓应用。

### 第一处修改

G:\flutterxx\demo\android\gradle\wrapper\gradle-wrapper.properties

```
distributionUrl=https\://services.gradle.org/distributions/gradle-8.3-all.zip
```


修改成

```
distributionUrl=https\://services.gradle.org/distributions/gradle-8.6-all.zip
```

### 第二处修改

ndk版本要改成你那里的版本，怎么查看ndk版本，Android Studio 那里查看sdk的界面就能看到。

G:\flutterxx\demo\android\app\build.gradle
修改成如下，将ndkVersion版本改成输入的版本号。

```android {
    namespace = "com.example.demo"
    compileSdk = flutter.compileSdkVersion
    //ndkVersion = flutter.ndkVersion
    ndkVersion = "28.0.12674087"
```

### 第三处修改

G:\flutterxx\demo\android\settings.gradle

```
plugins {
    id "dev.flutter.flutter-plugin-loader" version "1.0.0"
    id "com.android.application" version "8.1.0" apply false
    id "org.jetbrains.kotlin.android" version "1.8.22" apply false
}
```

修改成

```
plugins {
    id "dev.flutter.flutter-plugin-loader" version "1.0.0"
    id "com.android.application" version "8.4.2" apply false
    id "org.jetbrains.kotlin.android" version "2.0.20" apply false
}
```