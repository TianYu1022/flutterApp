import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ReadMoreTextDemo extends StatefulWidget {
  const ReadMoreTextDemo({Key? key}) : super(key: key);

  @override
  State<ReadMoreTextDemo> createState() => _ReadMoreTextDemoState();
}

class _ReadMoreTextDemoState extends State<ReadMoreTextDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ReadMoreTextDemo"),
        elevation: 0.0,
      ),
      body: Center(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReadMoreText(
                    'GeeksForGeeks is the best tutorial website for programmers.If you are beginner or intermediate or expert programmerGeeksForGeeks is the best website for learning to codeand learn different frameworks.',
                    trimLines: 2,
                    textScaleFactor: 1,
                    colorClickableText: Colors.red,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '显示更多',
                    trimExpandedText: '收起',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    moreStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                );
              })),
    );
  }
}
