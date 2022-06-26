import 'package:flutter/material.dart';

/// @author：TianYu
/// @describe：事件通知
/// createTime：2022/6/26 16:33
class TyChangeNotifier implements Listenable {
  List listeners = [];

  /// 添加监听器
  @override
  void addListener(VoidCallback listener) {
    listeners.add(listener);
  }

  /// 移除监听器
  @override
  void removeListener(VoidCallback listener) {
    listeners.remove(listener);
  }

  /// 通知所有监听器，触发监听器回调
  void notifyListeners() {
    for (var item in listeners) {
      item();
    }
  }
}
