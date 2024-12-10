// 创建一个新对象
class Post {
  String name = "zhuozhuo";
  int age = 10;

  // 在实例化新对象时传入参数, 相当于js的 constructor
  Post(this.name, this.age);

  // 父组件有一个函数(方法)

  String xixixi() {
    return "xixixixixi";
  }

  String hahaha() {
    return "hahahahahah";
  }
}

// class 继承: 保持父级class的所有属性和方法,并新增自己的属性和方法
class Fast extends Post {
  String number = "EEEXX";

  Fast(String name, int age) : super(name, age);

  String aoaoao() {
    return '$number $name $age';
  }

  // 重构父组件已有的函数
  @override
  String xixixi() {
    return "heiheiheiheihei";
  }
}
