import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDemo extends StatefulWidget {
  const DateDemo({Key key}) : super(key: key);

  @override
  State<DateDemo> createState() => _DateDemoState();
}

class _DateDemoState extends State<DateDemo> {
  var selectedDate = DateTime.now(); //现在
  var selectedTime = TimeOfDay(hour: 9, minute: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DateDemo"),
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
                InkWell(
                  onTap: _selectDate,
                  child: Row(
                    children: <Widget>[
                      Text(DateFormat.yMd().format(selectedDate)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
                InkWell(
                  onTap: _selectTime,
                  child: Row(
                    children: <Widget>[
                      Text(selectedTime.format(context)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _selectDate() async {
    var data = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (data == null) return;

    setState(() {
      selectedDate = data;
    });
  }

  Future<void> _selectTime() async {
    var timeOfDay =
        await showTimePicker(context: context, initialTime: selectedTime);

    if (timeOfDay == null) return;

    setState(() {
      selectedTime = timeOfDay;
    });
  }
}
