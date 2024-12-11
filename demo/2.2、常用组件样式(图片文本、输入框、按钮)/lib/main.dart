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
        body: const Padding(
          //边距设置
          padding: EdgeInsets.all(16.0), //4个方向各添加16像素补白
          child: LayoutDemo(),
        ),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    //文本输入框 控制器和焦点相关
    // TextEditingController _controller = TextEditingController();
    // FocusNode _focusNode = FocusNode();

    return Wrap(
      direction: Axis.horizontal,
      spacing: 20.0, //在direction: Axis.horizontal 的时候指左右两个Widget的间距,在direction: Axis.vertical 的时候指上下两个widget的间距
      runSpacing: 20.0, //在direction: Axis.horizontal 的时候指上下两个Widget的间距,在direction: Axis.vertical 的时候指左右两个widget的间距
      children: <Widget>[
        Wrap(
          direction: Axis.horizontal,
          spacing: 5.0, //在direction: Axis.horizontal 的时候指左右两个Widget的间距,在direction: Axis.vertical 的时候指上下两个widget的间距
          runSpacing: 5.0, //在direction: Axis.horizontal 的时候指上下两个Widget的间距,在direction: Axis.vertical 的时候指左右两个widget的间距
          alignment: WrapAlignment.start, //每一行子Widget排列，start从顶部开始 spaceAround子Widget间隔相等排序
          crossAxisAlignment: WrapCrossAlignment.start, // start/end水平排列时控制全部子widgets的上部/下部对齐，垂直排列时控制全部子widgets的左边/右边对齐
          textDirection: TextDirection.ltr, //ltr/rtl设置每一行（列）的子Widgets从左到右（从上到下）正常显示，正序/倒序排列
          //verticalDirection: VerticalDirection.up, //down设置行列widgets的展示，正常显示 up 倒序展示，比如，在direction: Axis.horizontal时有1、2、3行widgets，设置为up后，展示为3、2、1
          children: [
            Image.asset(
              //本地图片 1、要新建文件夹并放入图片 2、必须在yaml中的 assets: 下添加图片
              'images/home.png',
              alignment: Alignment.topLeft, //t图片对齐位置
              //fit: BoxFit.cover, //图片剪切 BoxFit.cover充满超出裁切 BoxFit.fitWidth/BoxFit.fitHeight 以高度/宽度充满超出裁切
              //repeat: ImageRepeat.repeat, //设置平铺 ImageRepeat.repeat铺满画布 ImageRepeat.repeatX: 横向填充，纵向横向不重复 ImageRepeat.repeatY纵向填充，横向不重复
              width: 24, //宽度
              height: 24, //高度
            ),
            Image.network(
              //远程图片
              'https://fastly.picsum.photos/id/312/50/50.jpg?hmac=2pMKARcuy2pzafwoomUjF50ekasE9MzjTKojiUoVVOg',
              alignment: Alignment.topLeft, //t图片对齐位置
              //fit: BoxFit.cover, //图片剪切 BoxFit.cover充满超出裁切 BoxFit.fitWidth/BoxFit.fitHeight 以高度/宽度充满超出裁切
              //repeat: ImageRepeat.repeat, //设置平铺 ImageRepeat.repeat铺满画布 ImageRepeat.repeatX: 横向填充，纵向横向不重复 ImageRepeat.repeatY纵向填充，横向不重复
              width: 24, //宽度
              height: 24, //高度
            ),
            const Divider(), //分割线
            const Text(
              '用户名',
              textAlign: TextAlign.center, //文本对齐方式（center居中，left左对齐，right右对齐，justfy两端对齐）
              maxLines: 1, //文字显示最大行数
              overflow: TextOverflow.ellipsis, //文字超出屏幕之后的处理方式（clip裁剪，fade渐隐，ellipsis省略号）
              style: TextStyle(
                //字体的样式设置
                color: Colors.blue, //颜色
                fontSize: 15, //字号
                fontWeight: FontWeight.bold, //加粗
                //fontStyle: FontStyle.italic, //倾斜
                //letterSpacing: 3, //字间距
                //decoration: TextDecoration.underline, //线条装饰
                //decorationColor: Colors.red,//线条颜色
                //decorationStyle: TextDecorationStyle.dashed, //虚线
              ),
            ),
            const TextField(
              keyboardType: TextInputType.text, //文本输入类型 text 文本 number数字 multiline多行
              maxLines: null, // 允许无限行
              // controller: _controller, //控制器和焦点相关
              // focusNode: _focusNode, //控制器和焦点相关
              decoration: InputDecoration(
                  //border: OutlineInputBorder(), //外框样式
                  //labelText: 'Enter your name', //描述
                  contentPadding: EdgeInsets.all(8.0),
                  prefixIcon: Icon(Icons.person), //icon
                  //suffixIcon: Icon(Icons.clear), //输入框右侧带 X 清除内容图标
                  //helperText: "helperText", //辅助文本，位于文本框底部
                  labelStyle: TextStyle(
                    //设置样式
                    color: Colors.green, ////颜色
                    fontSize: 20, //字号
                  )),
            ),
          ],
        ),
        const Wrap(
          direction: Axis.horizontal,
          spacing: 5.0, //在direction: Axis.horizontal 的时候指左右两个Widget的间距,在direction: Axis.vertical 的时候指上下两个widget的间距
          runSpacing: 5.0, //在direction: Axis.horizontal 的时候指上下两个Widget的间距,在direction: Axis.vertical 的时候指左右两个widget的间距
          alignment: WrapAlignment.start, //每一行子Widget排列，start从顶部开始 spaceAround子Widget间隔相等排序
          crossAxisAlignment: WrapCrossAlignment.start, // start/end水平排列时控制全部子widgets的上部/下部对齐，垂直排列时控制全部子widgets的左边/右边对齐
          textDirection: TextDirection.ltr, //ltr/rtl设置每一行（列）的子Widgets从左到右（从上到下）正常显示，正序/倒序排列
          //verticalDirection: VerticalDirection.up, //down设置行列widgets的展示，正常显示 up 倒序展示，比如，在direction: Axis.horizontal时有1、2、3行widgets，设置为up后，展示为3、2、1
          children: [
            Text(
              '密码',
              textAlign: TextAlign.center, //文本对齐方式（center居中，left左对齐，right右对齐，justfy两端对齐）
              maxLines: 1, //文字显示最大行数
              overflow: TextOverflow.ellipsis, //文字超出屏幕之后的处理方式（clip裁剪，fade渐隐，ellipsis省略号）
              style: TextStyle(
                //字体的样式设置
                color: Colors.blue, //颜色
                fontSize: 15, //字号
                fontWeight: FontWeight.bold, //加粗
                //fontStyle: FontStyle.italic, //倾斜
                //letterSpacing: 2, //字间距
              ),
            ),
            TextField(
              keyboardType: TextInputType.multiline, //文本输入类型 text 文本 number数字 multiline多行
              maxLines: null, // 允许无限行
              decoration: InputDecoration(
                  //border: OutlineInputBorder(), //外框样式
                  //labelText: 'Enter your name', //描述
                  contentPadding: EdgeInsets.all(8.0),
                  prefixIcon: Icon(Icons.person), //icon 输入框右侧带 X 清除内容图标
                  //suffixIcon: Icon(Icons.clear),
                  //helperText: "helperText", //辅助文本，位于文本框底部
                  labelStyle: TextStyle(
                    //设置样式
                    color: Colors.green, ////颜色
                    fontSize: 20, //字号
                  )),
            ),
          ],
        ),
        SizedBox(
          child: Center(
            child: ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))), //设置圆角，圆角程度
                backgroundColor: WidgetStateProperty.all(Colors.blue), //按钮背景色
                foregroundColor: WidgetStateProperty.all(Colors.black), //按钮的文字颜色
              ),
              onPressed: () {}, //点击事件，里面可以写被点击后进行的操作
              child: const Text('按钮'),
            ),
          ),
        ),
      ],
    );
  }
}
