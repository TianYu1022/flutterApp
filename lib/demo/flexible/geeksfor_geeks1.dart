import 'package:flutter/material.dart';

///水平响应式应用程序
///说明：
///再次通过查看应用程序的代码，我们可以看到这次每个Container小部件都使用了Flexible小部件。
///在顶部Row的Container小部件中，两个Container的 flex 属性设置为 1 ，
///控制区域如何在它们之间分布，fit 属性设置为 FlexFlit.loose ，
///确保这两个容器小部件可以选择占用最小面积。
///对于蓝色的Container，flex 属性设置为 1，fit 属性设置为 FlexFlit.loose。
///在底部Row的 Container 小部件中 flex 属性设置为 2，
///它们也将占用相等的半空间，我们通过将 Top Row中的 flex 设置为 1 来实现相同的结果。
///在这种情况下，两个Container的 fit 都设置为 FlexFit.tight，这将迫使它们占用最大的可用空间。
/// 可以看到，当屏幕尺寸在水平方向增加时，行中容器的宽度会根据屏幕尺寸进行调整，
/// 但蓝色容器不会改变其宽度，因为它是Column和Flexible的直接子级小部件只允许沿父小部件的主轴更改子小部件的大小，
/// 在Column的情况下是垂直的。当屏幕尺寸在垂直方向发生变化时，我们可以看到蓝色Container的高度发生了变化，
/// 但其他容器在这个方向上没有响应，因为它们是Row小部件的子级。
class GeeksforGeeks1 extends StatefulWidget {
  const GeeksforGeeks1({Key? key}) : super(key: key);

  @override
  State<GeeksforGeeks1> createState() => _GeeksforGeeks1State();
}

class _GeeksforGeeks1State extends State<GeeksforGeeks1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GeeksforGeeks1"),
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
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            height: 175,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ), //BoxDecoration
                          ), //Container
                        ), //Flexible
                        SizedBox(
                          width: 20,
                        ), //SizedBox
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: Container(
                              height: 175,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ) //BoxDecoration
                          ), //Container
                        ) //Flexible
                      ], //<Widget>[]
                      mainAxisAlignment: MainAxisAlignment.center,
                    ), //Row
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Container(
                        width: 380,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue), //BoxDecoration
                      ), //Container
                    ), //Flexible
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Container(
                            width: 180,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan,
                            ), //BoxDecoration
                          ), //Container
                        ), //Flexible
                        SizedBox(
                          width: 20,
                        ), //SizedBox
                        Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Container(
                                width: 180,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.cyan,
                                ) //BoxDecoration
                            ) //Container,
                        ) //Flexible
                      ], //<widget>[]
                      mainAxisAlignment: MainAxisAlignment.center,
                    ), //Row
                  ], //<Widget>[]
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ), //Column
              ) //Padding
          ), //Container
        )
    );
  }
}