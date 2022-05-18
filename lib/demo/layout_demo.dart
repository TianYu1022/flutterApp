import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StackDemo();
  }
}

///可设置最大 最小 宽高的 盒子
class ConstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: 200.0,
                  maxWidth: 200.0
              ),
              child: Container(
                color: Color.fromRGBO(3, 54, 255, 1.0),
              ))
        ],
      ),
    );
  }
}

///宽高比
class AspecyDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0),
            ),
          )
        ],
      ),
    );
  }
}

///一摞 witget
class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //spaceAround 均分控件
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topLeft, //对齐方式
            children: [
              SizedBox(
                width: 200.0,
                height: 300.0,
                child: Container(
                  alignment: Alignment(0.0, 0.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(3, 54, 255, 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Positioned(
                right: 20.0,
                top: 20.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 18.0),
              ),
              Positioned(
                right: 50.0,
                top: 55.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 23.0),
              ),
              Positioned(
                right: 30.0,
                top: 90.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 17.0),
              ),
              Positioned(
                right: 60.0,
                top: 120.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 23.0),
              ),
              Positioned(
                right: 25.0,
                top: 140.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 17.0),
              ),
              Positioned(
                right: 50.0,
                top: 170.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 19.0),
              ),
              Positioned(
                right: 15.0,
                top: 200.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 20.0),
              ),
              Positioned(
                right: 50.0,
                top: 240.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 30.0),
              ),
              Positioned(
                right: 25.0,
                top: 280.0,
                child: Icon(Icons.ac_unit, color: Colors.white, size: 26.0),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(3, 54, 255, 1.0),
                      shape: BoxShape.circle,
                      gradient: RadialGradient( //镜像渐变
                          colors: [
                            Color.fromRGBO(7, 102, 255, 1.0),
                            Color.fromRGBO(3, 54, 255, 1.0)
                          ])),
                  child:
                  Icon(Icons.brightness_2, color: Colors.white, size: 32.0),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

///自定义 可重复使用的徽章 widget
class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
