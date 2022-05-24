import 'package:flutter/material.dart';

import '../model/post.dart';

class PostShow extends StatelessWidget {
  final Post post;

  PostShow({
    this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Image.network(
            post.imageUrl,
            fit: BoxFit.cover,
            height: 250.0,
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.all(32.0),
            width: double.infinity, //铺满
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(post.title, style: Theme.of(context).textTheme.titleLarge),
                Text(post.author, style: Theme.of(context).textTheme.subtitle1),
                SizedBox(height: 32.0),
                Text(post.description,
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
