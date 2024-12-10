import "dart:io" show File, FileMode, Directory;

void demo() async {
  // 打开一个本地文件(打开路径实际相对与执行位置)
  var file = File("./lib/file.dart");

  // 读入文件, 然后正则去除换行和空格
  String content = await file.readAsString();
  String data = content.replaceAll(RegExp(r'[\s\n]+'), '');
  print(data);

  // 截取 20 个字符串用来写入
  String rest = data.substring(0, 20);

  // 追加写入文件(在结尾加上换行符)
  await file.writeAsString('// $rest \n', mode: FileMode.append);
}

void filedir() async {
  // 打开一个文件夹
  var dir = Directory('./');
  var entities = dir.list(recursive: true, followLinks: false);
  await for (var entity in entities) {
    ////过滤出所有文件
    //if (entity is File) {
    //  print(entity.path);
    //}
    //过滤出所有目录
    if (entity is Directory) {
      print(entity.path);
    }
    // 过滤出所有 .dart 结尾的文件
    // if (entity is File && entity.path.endsWith('.dart')) {
    //   print(entity.path);
    // }
  }
}
