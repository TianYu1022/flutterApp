import 'package:flutter/material.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  const PopupMenuButtonDemo({Key? key}) : super(key: key);

  @override
  State<PopupMenuButtonDemo> createState() => _PopupMenuButtonDemoState();
}

///弹出式菜单按钮
class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  var _currentMenuItem = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopupMenuButtonDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_currentMenuItem),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(child: Text("Home"), value: "Home"),
                    PopupMenuItem(child: Text("User"), value: "User"),
                    PopupMenuItem(child: Text("Page"), value: "Page"),
                  ],
                  onSelected: (value) {
                    // debugPrint("$value");
                    setState(() {
                      _currentMenuItem = "$value";
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
