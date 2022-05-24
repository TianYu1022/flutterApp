import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  const StreamDemoHome({Key key}) : super(key: key);

  @override
  State<StreamDemoHome> createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo; //控制器
  StreamSink _sinkDemo;
  var _data = "...";

  @override
  void initState() {
    super.initState();

    // Stream<String> _streamDemo = Stream.fromFuture(getData());
    // _streamDemo = StreamController<String>();
    _streamDemo = StreamController.broadcast();
    _sinkDemo = _streamDemo.sink;
    _streamDemoSubscription = _streamDemo.stream.listen(initData,
        onError: (error) => debugPrint(error),
        onDone: () => debugPrint("onDone"));
    _streamDemoSubscription = _streamDemo.stream.listen(initDataTwo,
        onError: (error) => debugPrint(error),
        onDone: () => debugPrint("onDone"));
  }

  void initData(String data) {
    setState(() {
      _data = data;
    });
    debugPrint(data);
  }

  void initDataTwo(String data) {
    debugPrint("getData two $data");
  }

  Future<String> getData() async {
    await Future.delayed(Duration(seconds: 3)); //等待3秒
    return "Hello ~";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(_data, style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold)),
            StreamBuilder(
                stream: _streamDemo.stream,
                initialData: "StreamBuilder initialData 的数据",
                builder: (context, snapshot) {
                  return Text(snapshot.data.toString(),
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold));
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(onPressed: _addDataToStream, child: Text("Add")),
                SizedBox(width: 10.0),
                ElevatedButton(onPressed: _pauseStream, child: Text("Pause")),
                SizedBox(width: 10.0),
                ElevatedButton(onPressed: _resumeStream, child: Text("Resume")),
                SizedBox(width: 10.0),
                ElevatedButton(onPressed: _cancelSteam, child: Text("Pause")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addDataToStream() async {
    debugPrint("add data to stream");

    String data = await getData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  void _pauseStream() {
    _streamDemoSubscription.pause();
  }

  void _resumeStream() {
    _streamDemoSubscription.resume();
  }

  void _cancelSteam() {
    _streamDemoSubscription.cancel();
  }

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }
}
