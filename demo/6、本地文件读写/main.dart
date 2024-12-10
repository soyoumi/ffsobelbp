import 'package:flutter/material.dart';
import './file.dart' show demo, filedir;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter App")),
        body: const LayoutDemo(),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    print("Hello World!");

    // demo(); // 文件操作
    filedir();

    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text("文件操作学习调试", style: Theme.of(context).textTheme.titleLarge),
    ]));
  }
}
