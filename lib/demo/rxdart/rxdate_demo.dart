import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDatrDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RxDatrDemo"),
        elevation: 0.0,
      ),
      body: RxDatrHomeDemo(),
    );
  }
}

class RxDatrHomeDemo extends StatefulWidget {
  const RxDatrHomeDemo({Key? key}) : super(key: key);

  @override
  State<RxDatrHomeDemo> createState() => _RxDatrHomeDemoState();
}

class _RxDatrHomeDemoState extends State<RxDatrHomeDemo> {
  @override
  void initState() {
    super.initState();
    /* Rx.combineLatest2(Stream.fromIterable(["hello", "你好"]),
            Stream.fromIterable(["1", "2"]), ((a, b) {}))
        .listen((event) {
      print("fromIterable -> $event");
    });*/

    Stream.fromIterable(["hello", "你好"]).listen((event) {
      print("fromIterable -> $event");
    });

    Rx.fromCallable(() => Future.value("哈哈哈哈")).listen((event) {
      print("fromIterable -> $event");
    });

    Rx.timer(["timer"], Duration(seconds: 3)).listen((event) {
      print(event);
    }); //间隔3秒

    ///stream 中 StreamController
    PublishSubject<String> _subject = PublishSubject<String>();
    _subject.add("第一条数据1111");
    _subject.listen((value) {print("listen 1: $value");});
    _subject.add("第二条数据222");
    _subject.listen((value) {print("listen 2: ${value.toUpperCase()}");});
    _subject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
