import 'package:flutter/material.dart';

/// @author：TianYu
/// @describe：继承提供者
/// createTime：2022/6/26 16:31
// 一个通用的InheritedWidget，保存任需要跨组件共享的状态
class TyInheritedProvider<T> extends InheritedWidget {
  const TyInheritedProvider(
      {Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  //共享状态使用泛型
  final T data;

  @override
  bool updateShouldNotify(TyInheritedProvider<T> oldWidget) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的 `didChangeDependencies`。
    return true;
  }
}
