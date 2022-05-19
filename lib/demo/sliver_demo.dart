import 'package:flutter/material.dart';
import 'package:number1/view/image_build_view.dart';
import 'package:number1/model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // title: Text("TIAN YU"),
            // pinned: true, //固定头部
            // floating: true,
            pinned: true,
            expandedHeight: 178.0, //弹性头部高度
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "TianYu Flutter".toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0, //文字边距
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                "http://m.qpic.cn/psc?/V124eZU41TdanL/ruAMsa53pVQWN7FLK88i5soFvNUt5OL5YhxPVdKAC2fGsQjHEUSglBsnOx7Uoc*TaT3P0NPhIZHWjyako34A9T*bsMi6YtPIt3c15KtKeDQ!/b&bo=3AX0AQAAAAABBww!&rf=viewer_4",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
            // 预留系统安全区
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverListDemo(), //条目
            ),
          )
        ],
      ),
    );
  }
}

///列表视图
class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: posts.length,
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            child: Material(
              borderRadius: BorderRadius.circular(8.0), //圆角
              elevation: 14.0, //阴影
              shadowColor: Colors.grey.withOpacity(0.5), //阴影颜色
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    //固定宽高比 使用 AspectRatio aspectRatio
                    aspectRatio: 16 / 9,
                    child: ImageBuildView(
                      posts[index].imageUrl,
                      radius: 12.0,
                    ),
                  ),
                  Positioned(
                    top: 32,
                    left: 32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          posts[index].title,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          posts[index].author,
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

///网格
class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: posts.length,
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
