import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({Key key}) : super(key: key);

  @override
  State<SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  var _switchItem = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SwitchDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
                value: _switchItem,
                onChanged: (value) {
                  setState(() {
                    _switchItem = value;
                  });
                },
              title: Text("Switch Item"),
              subtitle: Text("description"),
              secondary: Icon(_switchItem ? Icons.visibility : Icons.visibility_off),
              selected: _switchItem,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _switchItem ? "😁" : "😭",
                  style: TextStyle(fontSize: 32.0),
                ),
                Switch(
                    value: _switchItem,
                    onChanged: (value) {
                      setState(() {
                        _switchItem = value;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
