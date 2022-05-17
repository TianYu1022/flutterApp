import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerDemo();
  }
}

/// Container 容器 Row 横向容器
class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey[100],
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
            'http://m.qpic.cn/psc?/V124eZU41TdanL/ruAMsa53pVQWN7FLK88i5rljCB8OmG90YHeCbmC.*obZWZ5X3Xh*Qx79Quzk4lUcBo7w*ioAK2adiIjFQW6to69JqCP84RJRleUO2BInNwo!/b&bo=OARRBgAAAAABB0s!&rf=viewer_4'),
        alignment: Alignment.topCenter, //位置
        // repeat: ImageRepeat.repeatY, //Y轴铺开
        fit: BoxFit.cover, //填充满
        colorFilter: ColorFilter.mode(
          //滤镜
          Colors.yellow[100]!.withOpacity(0.1),
          BlendMode.hardLight,
        ),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, //主轴对齐
        children: <Widget>[
          Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
            // color: Color.fromRGBO(3, 54, 255, 1.0),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              //边框
              border: Border.all(
                color: Colors.indigoAccent,
                width: 3.0,
                style: BorderStyle.solid,
              ),
              //圆角 only() 单独添加
              // borderRadius: BorderRadius.circular(16.0),
              //阴影
              boxShadow: [
                BoxShadow(
                    offset: Offset(0.0, 16.0), //偏移
                    color: Color.fromRGBO(16, 20, 188, 1.0),
                    blurRadius: 25.0, //模糊半径
                    spreadRadius: 0.0 //扩散半径
                    )
              ],
              //shape 圆形盒子不能圆角
              shape: BoxShape.circle,
              //阴影 gradient 镜像渐变
              /*gradient: RadialGradient(
                colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 28, 128, 1.0)
                ]
              ),*/
              //线型渐变 默认左到右
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 28, 128, 1.0)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 富文本
class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        //富文本
        text: const TextSpan(
            text: 'godyutian@gmail',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 34.0,
                fontStyle: FontStyle.italic, //斜体
                fontWeight: FontWeight.w500 //粗体
                ),
            children: [
              TextSpan(
                  text: '.com', //子 TextSpan 什么都不写 和父 一样
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30.0,
                  )),
            ]),
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(fontSize: 16.0);

  final String _author = 'HongKong_Doll';
  final String _title = 'My name is HongKong_Doll';
  final String _content =
      '\r Google 官方认定开发第一语言，完全兼容 Java。 官方对于 Kotlin 本身的大力投入，进一步推进 Kotlin 更为迅猛的发展。比如 Android Studio 提供的一键式 Java 转 Kotlin 插件，一定程度上降低了 Kotlin 的学习成本。语言简洁性进一步带来代码量缩减。 在实现同等业务逻辑上，Kotlin 代码比 Java 代码更少。null 安全。 Java 逃脱不了的命运（java.lang.NullPointerException），虽然不能说是在 Kotlin 百分之百避免，有时候还是会因为不可抗因素引发相似问题，但是相对 Java 而言，Kotlin 已经很不错了。结构化并发。 通过引入协程简化异步编程。';

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_author see $_title. $_content',
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
