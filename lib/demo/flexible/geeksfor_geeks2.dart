import 'package:flutter/material.dart';

///用灵活的小部件包装顶部和底部的Row小部件
///说明：现在，在这个应用程序中，我们用灵活的小部件包装了顶部和底部的Row小部件，
///每个小部件的 flex 值为 1。这个应用程序中的所有 fit 属性都是对 FlexFit.tight 的更改，
///以强制子小部件获取所有他们可用的空间。
///还添加了两个SizeBox小部件，一个在蓝色Container的顶部，一个在其下方。

/// 再看一下app我们可以看到，当屏幕尺寸在垂直方向发生变化时，
/// 所有容器的高度也会随之变化，但是当屏幕尺寸在水平方向发生变化时，
/// 除了所有容器的蓝色容器宽度变化也。
/// 这是因为蓝色Container只是 Column 小部件的直接子级，它允许它在唯一的垂直方向上改变方向。
/// 虽然我们也可以通过使用Row小部件敲击蓝色Container来使其具有响应性，这将使其能够在使用Flexible包装时在水平方向上调整其大小，

/// 因此，这就是我们如何使用灵活的小部件使整个应用程序的小部件响应式响应。
class GeeksforGeeks2 extends StatefulWidget {
  const GeeksforGeeks2({Key? key}) : super(key: key);

  @override
  State<GeeksforGeeks2> createState() => _GeeksforGeeks2State();
}

class _GeeksforGeeks2State extends State<GeeksforGeeks2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GeeksforGeeks2"),
          elevation: 0.0,
        ),
        body: Center(
          child: Container(
              child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        )),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Text(
                      "Flexible(flex: 1, fit: FlexFit.tight, child :Widget) 当屏幕尺寸在垂直方向发生变化时，所有容器的高度也会随之变化，但是当屏幕尺寸在水平方向发生变化时，除了所有容器的蓝色容器宽度变化也。这是因为蓝色Container只是 Column 小部件的直接子级，它允许它在唯一的垂直方向上改变方向。虽然我们也可以通过使用Row小部件敲击蓝色Container来使其具有响应性，这将使其能够在使用Flexible包装时在水平方向上调整其大小，因此，这就是我们如何使用灵活的小部件使整个应用程序的小部件响应式响应。",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Row(
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
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Container(
                            width: 180,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan,
                            )),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          )), //Container
        ));
  }
}
