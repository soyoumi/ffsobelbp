import 'package:flutter/material.dart';
import 'package:demo3/post.dart' show EditPage, AddPage;
import 'package:sqlite3/sqlite3.dart' as sqlite3;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pathprovider;

class Pxx extends StatefulWidget {
  const Pxx({super.key});

  @override
  Pxxr createState() => Pxxr();
}

class Post {
  int id;
  String name;
  Post(this.id, this.name);
}

class Pxxr extends State<Pxx> {
  final List<Post> list = [];
  final TextEditingController _controller = TextEditingController();
  late sqlite3.Database db;

  getItems() async {
    final directory = await pathprovider.getApplicationDocumentsDirectory();
    db = sqlite3.sqlite3.open(path.join(directory.path, 'database.db'));
    final sqlite3.ResultSet result = db.select("SELECT name FROM sqlite_master WHERE type='table' AND name='dogs' COLLATE NOCASE");
    List<String> tablenames = [];
    for (final sqlite3.Row row in result) {
      tablenames.add(row['name']);
    }
    if (!tablenames.contains('dogs')) {
      db.execute('CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
    }
    final sqlite3.ResultSet data = db.select('SELECT * FROM dogs');
    for (final sqlite3.Row row in data) {
      print('Artist[id: ${row['id']}, name: ${row['name']}]');
      setState(() {
        list.add(Post(row['id'], row['name']));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      getItems();
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter List")),
      floatingActionButton: FloatingActionButton(
        child: const Text("ADD"),
        onPressed: () {
          print('新增一条数据');
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage())).then((value) async {
            if (value == null) return;
            db.execute('INSERT INTO dogs (name) values (?)', [value]);
            final int lastid = db.lastInsertRowId;
            setState(() {
              list.add(Post(lastid, value));
            });
          });
        },
      ),
      body: Column(
        children: [
          Wrap(
            children: [
              const Text("你好a"),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'bb',
                ),
              ),
            ],
          ),
          Wrap(
            children: [
              const Text("你好b"),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'cc',
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                Post item = list[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$index ${item.id} ${item.name}'),
                    Image.network('https://picsum.photos/250?image=9', width: 50, height: 50),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditPage(zujinaid: index, cont: item.name))).then((value) {
                              if (value == null) return;
                              print('修改一条数据');
                              setState(() {
                                list[value["id"]] = Post(item.id, value["text"]);
                              });
                              db.execute('UPDATE dogs SET name=? WHERE id=?', [value['text'], item.id]);
                            });
                          },
                          child: const Text('EDIT'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print('删除一条数据');
                            setState(() {
                              list.removeWhere((x) => x.id == item.id);
                            });
                            db.execute('DELETE FROM dogs WHERE id=?', [item.id]);
                          },
                          child: const Text('DEL'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
