import 'package:flutter/material.dart';

/// 路由  routes: {"/about": (context) => PageDemo(title: "pushNamed 跳转")}
class NavigationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: null,
              child: Text("Home"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "/about")
                // of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => PageDemo(
                //       title: "About",
                //     ),
                //   ),
                // )
                ;
              },
              child: Text("About"),
            ),
          ],
        ),
      ),
    );
  }
}

class PageDemo extends StatelessWidget {
  final String title;

  PageDemo({this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
