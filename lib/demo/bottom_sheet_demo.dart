import 'package:flutter/material.dart';

///底部可滑动弹窗
class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({Key? key}) : super(key: key);

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  var _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();
  var _optin = "Open BottomModelSheet";

  _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState
        ?.showBottomSheet((context) => BottomAppBar(
              child: Container(
                height: 90.0,
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.pause_circle_outline),
                    SizedBox(width: 16.0),
                    Text("我是从底下弹出来的dialog,\n可以滑动关闭"),
                    Expanded(
                        child: Text("Fix you - Globalay",
                            textAlign: TextAlign.right))
                  ],
                ),
              ),
            ));
  }

  ///不可点击其他区域底部可滑动弹窗
  _openModelBottomSheet() async {
    var option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 200.0,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Optiion A"),
                    onTap: () {
                      Navigator.pop(context, "A");
                    },
                  ),
                  ListTile(
                    title: Text("Optiion B"),
                    onTap: () {
                      Navigator.pop(context, "B");
                    },
                  ),
                  ListTile(
                    title: Text("Optiion C"),
                    onTap: () {
                      Navigator.pop(context, "C");
                    },
                  ),
                ],
              ));
        });

    if (option == null) return;

    setState(() {
      _optin = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text("BottomSheetDemo"),
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
                ElevatedButton(
                    onPressed: _openBottomSheet,
                    child: Text("Open BottomSheet")),
                SizedBox(width: 10.0),
                ElevatedButton(
                    onPressed: _openModelBottomSheet, child: Text(_optin)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
