import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({Key? key}) : super(key: key);

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  var _radioGroup = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RadioDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("RadioGroupValue $_radioGroup"),
            SizedBox(height: 32.0),
            RadioListTile(
              value: 0,
              groupValue: _radioGroup,
              onChanged: _handleRadioValueChanged,
              title: Text("Radio A"),
              subtitle: Text("description A"),
              selected: _radioGroup == 0,
              secondary: Icon(Icons.filter_1),
            ),
            RadioListTile(
              value: 1,
              groupValue: _radioGroup,
              onChanged: _handleRadioValueChanged,
              title: Text("Radio A"),
              subtitle: Text("description A"),
              selected: _radioGroup == 1,
              secondary: Icon(Icons.filter_1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                    value: 0,
                    groupValue: _radioGroup,
                    onChanged: _handleRadioValueChanged),
                Radio(
                    value: 1,
                    groupValue: _radioGroup,
                    onChanged: _handleRadioValueChanged)
              ],
            )
          ],
        ),
      ),
    );
  }

  void _handleRadioValueChanged(int? value) {
    setState(() {
      _radioGroup = value ?? _radioGroup;
    });
  }
}
