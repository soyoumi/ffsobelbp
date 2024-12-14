
## 前后端ws通信

服务端 nodejs

例子里的 app.js 就是对应的服务端nodejs例子代码。

nodejs需要安装包

```
npm i express -g
npm i socket.io -g
npm i http -g
```

需要懂nodejs开发基础

前端是 flutter ，就是对应的main.dart文件。

添加配置到yaml文件

在
```
dependencies:
  flutter:
    sdk: flutter
```
下添加以下配置
```
  socket_io_client: ^3.0.2
```
然后yaml文件右上角点击下载按钮安装依赖

