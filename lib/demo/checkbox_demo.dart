import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({Key key}) : super(key: key);

  @override
  State<CheckboxDemo> createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  var _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckboxDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CheckboxListTile(
              value: _isCheck,
              onChanged: (value) {
                setState(() {
                  _isCheck = value ?? false;
                });
              },
              title: Text("CheckBox item A"),
              subtitle: Text("description"),
              secondary: Icon(Icons.bookmark),
              selected: _isCheck,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: _isCheck,
                  onChanged: (bool value) {
                    setState(() {
                      _isCheck = value ?? false;
                    });
                  },
                  activeColor: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
