import 'package:flutter/material.dart';
import 'package:demo3/post.dart' show EditPage, AddPage;

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
  int pid = 0;
  final TextEditingController _controller = TextEditingController();

  pp() {
    print('class Pxxr 头部 pid:$pid');
  }

  @override
  Widget build(BuildContext context) {
    pp();
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter List")),
      floatingActionButton: FloatingActionButton(
        child: const Text("ADD"),
        onPressed: () {
          print('新增一条数据');
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage())).then((value) async {
            if (value == null) return;
            setState(() {
              list.add(Post(pid, value));
              pid++;
              print('pid:$pid');
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
                //Post item = list[index];
                Post item = list[index];
                //item.id = pid;
                print('item:$item item.id:${item.id} pid:$pid list:$list');
                print(list[index]);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('index:$index item.id:${item.id} item.name:${item.name}'),
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
                                print('item:$item pid:$pid list:$list');
                                print(list[index]);
                              });
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
