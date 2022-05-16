import 'package:flutter/material.dart';
import 'package:number1/model/post.dart';

void main() => runApp(App());

//无状态小部件 StatelessWidget 不需要修改状态的weidget
//有状态的小部件 StatefulWidget 需要修改状态的weidget
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], //整个容器背景
      appBar: AppBar(
        title: const Text('Tian Yu Test'),
        elevation: 30.0, //阴影
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: _listItemBuilder,
      ),
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      //容器
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.network(posts[index].imageUrl),
          const SizedBox(height: 16.0),
          Text(
            posts[index].title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            posts[index].author,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(height: 16.0)
        ],
      ),
    );
  }
}

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hello World',
        textDirection: TextDirection.ltr, //文字显示 从左到右
        style: TextStyle(
            fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }
}
