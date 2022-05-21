import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({Key? key}) : super(key: key);

  @override
  State<SliderDemo> createState() => _SliderDemoState();
}

///滑动选择器
class _SliderDemoState extends State<SliderDemo> {
  var _sliderItem = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SliderDemo"),
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
                Slider(
                  value: _sliderItem,
                  onChanged: (value) {
                    setState(() {
                      _sliderItem = value;
                    });
                  },
                  activeColor: Theme.of(context).toggleableActiveColor,
                  inactiveColor:
                      Theme.of(context).toggleableActiveColor.withOpacity(0.3),
                  max: 10.0,
                  min: 0.0,
                  divisions: 10,
                  label: "${_sliderItem.toInt()}",
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text("SelderValue $_sliderItem")
          ],
        ),
      ),
    );
  }
}
