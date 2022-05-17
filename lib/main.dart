import 'package:flutter/material.dart';
import 'package:number1/model/post.dart';

import 'demo/listview_demo.dart';

void main() => runApp(App());

//无状态小部件 StatelessWidget 不需要修改状态的weidget
//有状态的小部件 StatefulWidget 需要修改状态的weidget
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //debug调试
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Colors.transparent, //水波纹
        splashColor: Colors.transparent, //水波纹
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, //标签的数量
      child: Scaffold(
        backgroundColor: Colors.grey[100], //整个容器背景
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigration', //说明作用
          //   onPressed: () => debugPrint('这是点击事件.'),
          // ), 自己添加的 右边的 icon
          title: const Text('Tian Yu Test'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search', //说明作用
              onPressed: () => debugPrint('这是SearchButton点击事件.'),
            )
          ],
          elevation: 30.0, //阴影
          bottom: const TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label, //tab 等宽
            indicatorWeight: 1.0,
            tabs: <Widget>[
              //标签视图
              const Tab(icon: const Icon(Icons.local_florist)),
              const Tab(icon: Icon(Icons.change_history)),
              const Tab(icon: const Icon(Icons.directions_bike))
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
            const Icon(Icons.change_history, size: 128.0, color: Colors.black12),
            const Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Tian Yu Flutter App !'.toUpperCase()), //把文字大写
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
              ),
              ListTile(
                title: const Text(
                  'Message',
                  textAlign: TextAlign.right,
                ),
                trailing: const Icon(
                  //标题后加一个图标 标题前为 trailing
                  Icons.message,
                  color: Colors.black12,
                  size: 22.0,
                ),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: const Text(
                  'Favorite',
                  textAlign: TextAlign.right,
                ),
                trailing: const Icon(
                  Icons.favorite,
                  color: Colors.black12,
                  size: 22.0,
                ),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: const Text(
                  'Settings',
                  textAlign: TextAlign.right,
                ),
                trailing: const Icon(
                  Icons.settings,
                  color: Colors.black12,
                  size: 22.0,
                ),
                onTap: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
