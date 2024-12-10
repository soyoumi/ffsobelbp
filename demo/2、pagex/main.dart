import 'package:flutter/material.dart';

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
    return const Wrap(
      children: <Widget>[
        Text(
          '文本 1',
          style: TextStyle(
            //color:Color()
            height: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 94, 30, 30),
          ),
        ),
        Text('文本 2'),
        Text('文本 3'),
        Wrap(
          children: [
            Wrap(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      child: Column(
                        children: [Text('data')],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
