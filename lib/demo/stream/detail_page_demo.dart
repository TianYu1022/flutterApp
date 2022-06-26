import 'package:flutter/material.dart';
import 'package:number1/utils/dialog.dart';

class DetailPageDemo extends StatefulWidget {
  const DetailPageDemo({Key? key}) : super(key: key);

  @override
  State<DetailPageDemo> createState() => _DetailPageDemoState();
}

class _DetailPageDemoState extends State<DetailPageDemo> {
  @override
  Widget build(BuildContext context) {
    /// 头部部分
    Widget headSection = Image.network(
      "http://m.qpic.cn/psc?/V124eZU41TdanL/ruAMsa53pVQWN7FLK88i5soFvNUt5OL5YhxPVdKAC2fGsQjHEUSglBsnOx7Uoc*TaT3P0NPhIZHWjyako34A9T*bsMi6YtPIt3c15KtKeDQ!/b&bo=3AX0AQAAAAABBww!&rf=viewer_4",
      fit: BoxFit.cover,
      height: 250,
    );

    /// 标题部分
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: const Text("Childhood in a picture",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const Text(
                "Mohamed Chahin",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )),
          const Icon(
            Icons.star,
            color: Colors.red,
          ),
          const Text("41")
        ],
      ),
    );

    /// 构建可点击 上图下文本按钮
    GestureDetector buildButtonColumn(IconData iconData, String label,
        {Function()? onTab}) {
      var primaryColor = Colors.blue; // 主色
      return GestureDetector(
          onTap: () {
            if (onTab != null) {
              onTab();
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(iconData, color: primaryColor),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: Text(label,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    )),
              )
            ],
          ));
    }

    /// 按钮部分
    Widget buttonSection = Container(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildButtonColumn(Icons.call, "call".toUpperCase(),
              onTab: () => showToast(msg: "call")),
          buildButtonColumn(Icons.near_me, "near_me".toUpperCase(),
              onTab: () => showToast(msg: "near_me")),
          buildButtonColumn(Icons.share, "share".toUpperCase(),
              onTab: () => showToast(msg: "share")),
        ],
      ),
    );

    /// 文本详情部分
    Widget textSection = Container(
        padding: const EdgeInsets.all(32.0),
        child: const Text('''
            Essie ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.
      ''',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )));

    Widget bottomButton = Container(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
        child: TextButton(
            style: ButtonStyle(
                //圆角
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0))),
                //边框
                side: MaterialStateProperty.all(
                  const BorderSide(color: Colors.blue, width: 0.67),
                ),
                //背景
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
            child: const Text(
              '确定',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 14),
            ),
            onPressed: () {
              showToast(msg: "确定");
            }));

    return Scaffold(
      appBar: AppBar(
        title: const Text('详情Demo页面'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          headSection,
          titleSection,
          buttonSection,
          textSection,
          bottomButton
        ],
      ),
    );
  }
}
