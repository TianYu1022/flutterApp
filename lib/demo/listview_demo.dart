import 'package:flutter/material.dart';
import '../model/post.dart';

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
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