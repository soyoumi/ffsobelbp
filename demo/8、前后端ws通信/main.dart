import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late io.Socket socket;
  void _listenWebSocket() async {
    socket = io.io('http://127.0.0.1:3200/', <String, dynamic>{
      'transports': ['websocket'],
      'extraHeaders': {'foo': 'bar'} // optional
    });
    // 链接建立成功之后，可以发送数据到socket.io的后端了
    socket.on('connect', (_) {
      print('connect');
      socket.emit('Fmessage', 'test');
    });
    //链接建立失败时调用
    socket.on('error', (data) {
      print('error');
      print(data);
    });
    // 链接出错时调用
    socket.on("connect_error", (data) => print('connect_error: '));
    // 链接断开时调用
    socket.on('disconnect', (_) => print('disconnect======'));
    // 链接关闭时调用
    socket.on('close', (_) => print('close===='));
    // // 服务端emit一个message的事件时，可以直接监听到
    socket.on('Kmessage', (data) {
      print('收到消息：Konmessage');
      print(data);
    });
  }

  // 关闭websocket链接，避免内存占用
  @override
  void dispose() {
    super.dispose();
    print('close');
    socket.close();
  }

  @override
  Widget build(BuildContext context) {
    var spacer = const SizedBox(height: 32.0);

    setState(() {
      _listenWebSocket();
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('ws'),
            spacer,
            ElevatedButton(
              onPressed: () => {},
              child: const Text('按钮'),
            ),
          ],
        ),
      ),
    );
  }
}
