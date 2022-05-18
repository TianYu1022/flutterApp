import 'package:flutter/cupertino.dart';

class ImageBuildView extends StatelessWidget {
  final String url;
  final double radius;

  ImageBuildView(this.url, {this.radius = 8.0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: FadeInImage.assetNetwork(
        placeholder: "assets/images/ic_error.jpg",
        image: url,
        fit: BoxFit.cover,
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset("assets/images/ic_error.jpg");
        },
      ),
    );
  }
}
