import 'package:flutter/material.dart';

import '../project/db/hi_cache.dart';

class ClickButtonDemo extends StatefulWidget {
  const ClickButtonDemo({Key? key}) : super(key: key);

  @override
  State<ClickButtonDemo> createState() => _ClickButtonDemoState();
}

class _ClickButtonDemoState extends State<ClickButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ClickButtonDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.topLeft, //对齐方式
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: Container(
                      alignment: Alignment(0.0, 0.0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(3, 54, 255, 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200.0,
                  height: 30.0,
                  child: GestureDetector(
                    //子 widget 可点击控件
                    onTap: clickButton,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(3, 54, 255, 1.0),
                          shape: BoxShape.circle,
                          gradient: RadialGradient(//镜像渐变
                              colors: [Colors.green, Colors.green])),
                      child: Icon(Icons.add, color: Colors.white, size: 32.0),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // void clickButton() {
  //   showToast(msg: "点击了按钮");
  // }

  // void clickButton() async {
  //   var request = TestRequest();
  //   request.add("aaa", "aaa").add("bbb", "bbb").add("requestPrams", "田宇");
  //
  //   var result = await HiNet.getInstance().fire(request);
  //   var testEntity = TestEntity.fromJson(result);
  //   debugPrint("睚眦 => ${testEntity.data?.requestPrams}");
  //
  //   /*try {
  //     var result = await HiNet.getInstance().fire(request);
  //     debugPrint("睚眦 result => $result");
  //   } on NeedAuth catch (e) {
  //     debugPrint("睚眦 NeedAuth => ${e.toString()}");
  //   } on NeedLogin catch (e) {
  //     debugPrint("睚眦 NeedLogin => ${e.toString()}");
  //   } on HiNetError catch (e) {
  //     debugPrint("睚眦 HiNetError => ${e.toString()}");
  //   }*/
  // }

  void clickButton() async {
    HiCache.getInstance().setString("key", "田宇11111");
    var a = HiCache.getInstance().get<int>("key");
    debugPrint("睚眦 => $a");

    HiCache.getInstance().setString("name", "田宇");
    HiCache.getInstance().setInt("age", 20);
    var name = HiCache.getInstance().get("name");
    var age = HiCache.getInstance().get("age");
    debugPrint("睚眦 => name $name age $age");
  }
}
