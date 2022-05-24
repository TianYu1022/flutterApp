class DataEntity {
  List<Posts> posts;

  DataEntity({this.posts});

  DataEntity.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts.add(Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (posts != null) {
      data['posts'] = posts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int id;
  String title;
  String author;
  String description;
  String imageUrl;

  Posts({this.id, this.title, this.author, this.description, this.imageUrl});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['author'] = author;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }
}