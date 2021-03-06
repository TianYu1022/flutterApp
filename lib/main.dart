import 'package:flutter/material.dart';
import 'package:number1/demo/form_demo.dart';
import 'package:number1/model/material_components.dart';
import 'package:provider/provider.dart';
import 'demo/basic_demo.dart';
import 'demo/bolc/application_bloc.dart';
import 'demo/bolc/bloc_provider.dart';
import 'demo/botton_navigation_bar_demo.dart';
import 'demo/drawer_demo.dart';
import 'demo/layout_demo.dart';
import 'demo/listview_demo.dart';
import 'demo/navigation_demo.dart';
import 'demo/provider/demo/cart_model.dart';
import 'demo/sliver_demo.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'global.dart';

void main() => Global.init().then((e) => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
      ],
      child: const App(),
    )));

//无状态小部件 StatelessWidget 不需要修改状态的weidget
//有状态的小部件 StatefulWidget 需要修改状态的weidget
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      //debug调试
      // home: Home(),
      initialRoute: "/mdc",
      routes: {
        "/home": (context) => Home(),
        "/about": (context) => PageDemo(title: "pushNamed 跳转"),
        "/form": (context) => FromDemo(),
        "/mdc": (context) =>
            BlocProvider(bloc: ApplicationBloc(), child: MaterialComponents()),
      },
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Colors.transparent,
        //水波纹
        splashColor: Colors.transparent,
        //水波纹
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        toggleableActiveColor: Colors.green,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, //标签的数量
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          //整个容器背景
          appBar: AppBar(
            // leading: IconButton(
            //   icon: Icon(Icons.menu),
            //   tooltip: 'Navigration', //说明作用
            //   onPressed: () => debugPrint('这是点击事件.'),
            // ), 自己添加的 右边的 icon
            title: const Text('Tian Yu APP'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Search', //说明作用
                onPressed: () => debugPrint('这是SearchButton点击事件.'),
              )
            ],
            elevation: 0.0, //阴影
            bottom: const TabBar(
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.black54,
              indicatorSize: TabBarIndicatorSize.label,
              //tab 等宽
              indicatorWeight: 1.0,
              tabs: <Widget>[
                //标签视图
                Tab(icon: Icon(Icons.local_florist)),
                Tab(icon: Icon(Icons.change_history)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.view_quilt))
              ],
            ),
          ),
          body: TabBarView(
            //内容
            children: <Widget>[
              ListViewDemo(),
              BasicDemo(),
              LayoutDemo(),
              SliverDemo(),
            ],
          ),
          drawer: DrawerDemo(),
          //侧边抽屉
          bottomNavigationBar: BottomNavigationBarDemo()),
    );
  }
}
