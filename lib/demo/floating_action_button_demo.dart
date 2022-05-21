import 'package:flutter/material.dart';
import 'package:number1/demo/button_demo.dart';

///悬浮按钮
class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _floatingActionButton = FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
           MaterialPageRoute(builder: (context) => ButtonDemo())
        );
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      elevation: 1.0,
      /* shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(30.0), //切正方形角
    ),*/
    );

    final _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: () {},
      label: Text("add"),
      icon: Icon(Icons.add),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButtonDemo"),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        //底部工具栏
        child: Container(
          height: 44.0,
        ),
        shape: CircularNotchedRectangle(), //切出一个缺口
      ),
    );
  }
}