import 'package:flutter/material.dart';
import 'package:number1/model/post.dart';
import 'package:number1/view/image_build_view.dart';

class CardDemo extends StatefulWidget {
  const CardDemo({Key? key}) : super(key: key);

  @override
  State<CardDemo> createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CardDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: posts
              .map((post) => Card(
                    child: Column(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0)
                            ),
                            child: ImageBuildView(post.imageUrl,radius: 0.0),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(post.imageUrl)),
                          title: Text(post.title),
                          subtitle: Text(post.author),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(post.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis), //显示两行 ...结尾
                        ),
                        ButtonTheme(
                            child: ButtonBar(
                          children: <Widget>[
                            TextButton(
                              onPressed: () {},
                              child: Text("Like".toUpperCase(),
                                  style: const TextStyle(color: Colors.redAccent)),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text("Read".toUpperCase(),
                                  style: const TextStyle(color: Colors.grey)),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
