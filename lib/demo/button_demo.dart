import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///ButtonBar 可以不用
    final buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
            data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
            ),
            child: ButtonBar(
              children: <Widget>[
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "ButtonBar中的Button",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "ButtonBar中的Button",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ))
      ],
    );

    ///扩展按钮 等分 或者 比例分配
    final Widget expandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            child: Text(
              "比例占1",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SizedBox(width: 20.0),
        Expanded(
          flex: 2,
          child: OutlinedButton(
            onPressed: () {},
            child: Text(
              "比例占2",
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );

    ///固定宽度的button
    final Widget fixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200.0,
          child: OutlinedButton(
            onPressed: () {},
            child: Text(
              "固定宽度的button",
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );

    ///描边按钮
    final Widget oulineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlinedButton(
          onPressed: () {},
          child: Text(
            "圆角OutlinedButton",
            style: TextStyle(color: Colors.black),
          ),
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              side: MaterialStateProperty.all(
                BorderSide(color: Colors.blue, width: 5),
              )), //设置背景全部透明
        ),
        SizedBox(
          width: 10.0,
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text(
            "Button",
            style: TextStyle(color: Colors.green),
          ),
          style: TextButton.styleFrom(
            primary: Colors.blue, //点击溅墨效果背景颜色效果
            textStyle: TextStyle(color: Colors.black45, fontSize: 14.0),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        OutlinedButton.icon(
          onPressed: () {},
          label: Text(
            "Button",
          ),
          icon: Icon(Icons.add),
          style: TextButton.styleFrom(
            primary: Colors.black, //主颜色
            textStyle: TextStyle(color: Colors.black45, fontSize: 14.0),
          ),
        ),
      ],
    );

    ///高亮按钮
    final Widget elevatedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "圆角Button",
            style: TextStyle(color: Colors.black),
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35))),
          ), //设置背景全部透明
        ),
        SizedBox(
          width: 10.0,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "Button",
            style: TextStyle(color: Colors.green),
          ),
          style: TextButton.styleFrom(
              primary: Colors.blue, //点击溅墨效果背景颜色效果
              textStyle: TextStyle(color: Colors.black45, fontSize: 14.0),
              elevation: 12.0),
        ),
        SizedBox(
          width: 10.0,
        ),
        ElevatedButton.icon(
          onPressed: () {},
          label: Text(
            "Button",
          ),
          icon: Icon(Icons.add),
          style: TextButton.styleFrom(
            primary: Colors.black, //主颜色
            textStyle: TextStyle(color: Colors.black45, fontSize: 14.0),
          ),
        ),
      ],
    );

    ///可点击的文字按钮
    final textButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: Text(
            "背景透明点击无背景",
            style: TextStyle(color: Colors.black),
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ), //设置背景全部透明
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "text button",
            style: TextStyle(color: Colors.green),
          ),
          style: TextButton.styleFrom(
            primary: Colors.blue, //点击溅墨效果背景颜色效果
            textStyle: TextStyle(color: Colors.black45, fontSize: 14.0),
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          label: Text(
            "带图标按钮",
          ),
          icon: Icon(Icons.add),
          style: TextButton.styleFrom(
            primary: Colors.black, //主颜色
            textStyle: TextStyle(color: Colors.black45, fontSize: 14.0),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            textButtonDemo, //文字按钮
            elevatedButtonDemo, //button
            oulineButtonDemo, //描边按钮
            fixedWidthButton, //固定宽度的button
            expandedButton, //扩展按钮 等分 或者 比例分配
            buttonBarDemo, //ButtonBar 可以不用
          ],
        ),
      ),
    );
  }
}