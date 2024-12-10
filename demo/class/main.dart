import 'package:flutter/material.dart';
import './object.dart' show Post, Fast;

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

    // 这里传入参数实例化一个新对象
    Post post = new Post("fengqing", 11);
    print(post.name);

    Fast fast = new Fast("fengqing", 11);
    print('aoaoao: ${fast.aoaoao()}');
    print('xixixi: ${fast.xixixi()}');
    print('hahaha: ${fast.hahaha()}');

    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text("类学习调试", style: Theme.of(context).textTheme.titleLarge),
    ]));
  }
}
