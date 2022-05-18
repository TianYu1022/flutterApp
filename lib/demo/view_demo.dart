import 'package:flutter/material.dart';
import 'package:number1/model/post.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewBuilder();
  }
}

class GridViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        // crossAxisSpacing: 8.0, //间隔
        // mainAxisSpacing: 8.0
      ),
    );
  }

  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

///网格布局 1
class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      //一行显示的数量
      crossAxisSpacing: 16.0,
      //交叉轴间距
      mainAxisSpacing: 16.0,
      //主轴间距
      scrollDirection: Axis.vertical,
      children: _buildTiles(100),
    );
  }

  List<Widget> _buildTiles(int length) {
    return List.generate(
        length,
        (index) => Container(
            color: Colors.grey[300],
            alignment: Alignment(0.0, 0.0),
            child: Text(
              'Item $index',
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
            )));
  }
}

///网格布局 2
class GridViewExtentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      scrollDirection: Axis.vertical,
      maxCrossAxisExtent: 140.0,
      //交叉轴最大尺寸
      children: _buildTiles(100),
    );
  }

  List<Widget> _buildTiles(int length) {
    return List.generate(
        length,
        (index) => Container(
            color: Colors.grey[300],
            alignment: Alignment(0.0, 0.0),
            child: Text(
              'Item $index',
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
            )));
  }
}

///加载数据的PageView
class PageViewBuilderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }

  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          //尺寸占满可用空间
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                posts[index].author,
                style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      /// pageSnapping: false, //不要滚动效果
      /// reverse: true, //倒置
      /// scrollDirection: Axis.vertical, //滚动方式
      /// onPageChanged: (currentPage) => debugPrint('当前页面$currentPage'), //滚动监听
      controller: PageController(
        initialPage: 0, //初始页面
        keepPage: true, //是否记住滚动到哪
        viewportFraction: 1.0, //可视窗口比例
      ),
      children: [
        Container(
          color: Colors.red[100],
          alignment: Alignment(0.0, 0.0),
          child: Text('ONE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.green[100],
          alignment: Alignment(0.0, 0.0),
          child: Text('TWO',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.blue[100],
          alignment: Alignment(0.0, 0.0),
          child: Text('THREE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        )
      ],
    );
  }
}
