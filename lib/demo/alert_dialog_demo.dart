import 'package:flutter/material.dart';

enum Action { OK, CANCLE }

///提示对话框
class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({Key? key}) : super(key: key);

  @override
  State<AlertDialogDemo> createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  var _choice = "nothing";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertDialogDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Your choice is: $_choice",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 32.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: _openAlerDialog, child: Text("Open AlerDialog"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future _openAlerDialog() async {
    var action = await showDialog(
        context: context,
        barrierDismissible: false, //点击空白无法关闭
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("AlerDialog"),
            content: Text("Are you sure about this?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, Action.CANCLE);
                },
                child: const Text(
                  "cancle",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, Action.OK);
                },
                child: const Text(
                  "ok",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          );
        });

    switch (action) {
      case Action.OK:
        setState(() {
          _choice = "OK";
        });
        break;
      case Action.CANCLE:
        setState(() {
          _choice = "CANCLE";
        });
        break;
      default:
    }
  }
}
