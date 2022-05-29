import 'package:flutter/material.dart';

///非响应式 应用
///说明：
///看一下代码，我们可以看到在屏幕顶部我们有一个基本的应用栏构建，
///其中包含一个主要菜单IconButton里面的 AppBar 小部件。
///在应用程序的主体中，父小部件是Center，然后是Container和Padding。
///之后，我们有一个Column小部件，它将小部件列表作为子小部件。
///在该列表中，第一个小部件是一个Row，其中包含两个 Container 和一个 SizedBox。
///容器被赋予一个高度和每个宽度为 175，在装饰属性的帮助下，颜色设置为红色，边框半径为 10。
///接下来是Row外部的Container，宽度为 380，高​​度为 200。颜色设置为蓝色，边框半径为 10。
///接下来是另一个Row，其中包含两个容器，每个容器都具有青色，高度为 300，宽度为 180。在容器之间，有一个宽度为 20 的 SizedBox 小部件。
///两行，主轴对齐设置为中心，在列中，主轴对齐设置为spaceBetween交叉轴对齐设置为中心。
/// 我们可以在这个应用程序中看到有五个容器不会根据屏幕大小改变它们的大小，这意味着小部件没有响应。
class GeeksforGeeks extends StatefulWidget {
  const GeeksforGeeks({Key? key}) : super(key: key);

  @override
  State<GeeksforGeeks> createState() => _GeeksforGeeksState();
}

class _GeeksforGeeksState extends State<GeeksforGeeks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GeeksforGeeks"),
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 175,
                        height: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ), //BoxDecoration
                      ), //Container
                      SizedBox(
                        width: 20,
                      ), //SizedBox
                      Container(
                          width: 175,
                          height: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                          ) //BoxDecoration
                      ) //Container
                    ], //<Widget>[]
                    mainAxisAlignment: MainAxisAlignment.center,
                  ), //Row
                  Container(
                    width: 380,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue), //BoxDecoration
                  ), //Container
                  Row(
                    children: <Widget>[
                      Container(
                        width: 180,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.cyan,
                        ), //BoxDecoration
                      ), //Container
                      SizedBox(
                        width: 20,
                      ), //SizedBox
                      Container(
                          width: 180,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.cyan,
                          ) //BoxedDecoration
                      ) //Container
                    ], //<Widget>[]
                    mainAxisAlignment: MainAxisAlignment.center,
                  ), //Row
                ], //<widget>[]
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
              ), //Column
            ) //Padding
        ), //Container
      )
    );
  }
}