import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../view/image_build_view.dart';
import 'DataEntity.dart';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  const HttpDemoHome({Key? key}) : super(key: key);

  @override
  State<HttpDemoHome> createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    // var data = getData();
    // data.then((value) => debugPrint(json.encode(value)));
  }

  Future<List<Posts>?> getData() async {
    final response =
        await Dio().get("https://resources.ninghao.net/demo/posts.json");
    if (response.statusCode == 200) {
      return DataEntity.fromJson(response.data).posts;
    } else {}
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                child: Center(
              child: Text("Loading...."),
            ));
          }

          var data = snapshot.data as List<Posts>?;

          if (data == null || data.isEmpty) {
            return Container(
                child: Center(
              child: Text("error!"),
            ));
          }

          return _contentChild(data);
        });
  }

  /// ListView.builder 利用 listview 的 builder 方法去优化列表
  _contentChild(List<Posts> data) => ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var bean = data[index];
        return Card(
          child: Column(
            children: contentChildren(bean),
          ),
        );
      },
      itemCount: data.length);

  List<Widget> contentChildren(Posts bean) {
    return <Widget>[
      AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
          child: ImageBuildView(bean.imageUrl ?? "", radius: 0.0),
        ),
      ),
      ListTile(
        leading:
            CircleAvatar(backgroundImage: NetworkImage(bean.imageUrl ?? "")),
        title: Text(bean.title ?? ""),
        subtitle: Text(bean.author ?? ""),
      ),
      Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(bean.description ?? "",
            maxLines: 2, overflow: TextOverflow.ellipsis), //显示两行 ...结尾
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
    ];
  }
}

// debugPrint("statusCode: ${response.data}");

// var postModel = DataEntity.fromJson(response.data);
// debugPrint(
//     "标题 -> ${postModel.posts?[0].title} 描述 -> ${postModel.posts?[0].description}");

// debugPrint("data ${json.encode(postModel)}");

/*void testGetData() {
  final post = {
    "title": "Hello",
    "description": "nice to meet you",
  };

  debugPrint(post["title"]);
  debugPrint(post["description"]);

  final postJson = json.encode(post);
  debugPrint(postJson);

  var decode = json.decode(postJson);
  debugPrint("decode ${decode["title"]}");
  debugPrint("decode ${decode["description"]}");
  debugPrint("decode is Map ${decode is Map}");

  var postModel = PostEntity.fromJson(decode);
  debugPrint(
      "fromJson ${postModel.title} ,description ${postModel.description}");

  debugPrint("toJson ${json.encode(postModel)}");
}

class PostEntity {
  final String title;
  final String description;

  PostEntity({required this.title, required this.description});

  PostEntity.fromJson(Map json)
      : title = json["title"],
        description = json["description"];

  Map toJson() => {
        "title": title,
        "description": description,
      };
}*/
