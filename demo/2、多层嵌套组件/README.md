
## 多层嵌套组件

比如

Column  children: <Widget>[ 子元素 ]

Wrap(children: [ 子元素 ])

Card(child: Column(children: [ 子元素 ]))


##### 里面的子元素就可以嵌套，更多可以嵌套的组件如下：

```
拥有多个子元素的布局widget
Row：在水平方向上排列子widget的列表
Column：在垂直方向上排列子widget的列表
Stack：可以允许其子widget简单的堆叠在一起
IndexedStack：从一个子widget列表中显示单个孩子的Stack
Flow：一个实现流式布局算法的widget
Table：为其子widget使用表格布局算法的widget
Wrap：可以在水平或垂直方向多行显示其子widget
ListBody：一个widget，它沿着一个给定的轴，顺序排列它的子元素
ListView：可滚动的列表控件。ListView是最常用的滚动widget，它在滚动方向上一个接一个地显示它的孩子。在纵轴上，孩子们被要求填充ListView
CustomMultiChildLayout：使用一个委托来对多个孩子进行设置大小和定位的小部件
```
资料摘录：[w3cschool](https://www.w3cschool.cn/evilg/evilg-gi7e35tq.html)