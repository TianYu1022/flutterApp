import 'package:flutter/material.dart';
import 'package:number1/demo/post_show.dart';
import 'package:number1/view/image_build_view.dart';
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
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ImageBuildView(
                  posts[index].imageUrl,
                  radius: 8.0,
                ),
              ),
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
          Positioned.fill(
            //0.0,0.0
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                //溅墨效果
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.white.withOpacity(0.1),
                onTap: () {
                  //点击事件
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PostShow(
                        post: posts[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
