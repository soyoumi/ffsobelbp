import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter List")),
      body: Center(
        child: ListView(
          children: <Widget>[
            const Text(
              'phone',
              style: TextStyle(
                fontSize: 48,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mascot Name',
              ),
            ),
            Image.network('https://picsum.photos/250?image=9'),
            ElevatedButton(
              child: const Text('添加'),
              onPressed: () {
                Navigator.of(context).pop(_controller.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EditPage extends StatelessWidget {
  final int zujinaid;
  final String cont;
  final TextEditingController _controller = TextEditingController();

  EditPage({super.key, required this.zujinaid, required this.cont});

  @override
  Widget build(BuildContext context) {
    _controller.text = cont;
    return Scaffold(
      appBar: AppBar(title: const Text("Item Edit")),
      body: Center(
        child: ListView(
          children: <Widget>[
            const Text(
              'phone',
              style: TextStyle(
                fontSize: 48,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'xxx $cont',
              ),
            ),
            Image.network('https://picsum.photos/250?image=9'),
            ElevatedButton(
              child: const Text('更新'),
              onPressed: () {
                Navigator.of(context).pop({"id": zujinaid, "text": _controller.text});
              },
            ),
          ],
        ),
      ),
    );
  }
}
