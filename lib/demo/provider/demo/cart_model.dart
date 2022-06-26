import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'item_entity.dart';

/// @author：TianYu
/// @describe：保存购物车内商品数据
/// createTime：2022/6/26 16:51
class TyCartModel extends ChangeNotifier {
  // 用于保存购物车中商品列表
  final List<ItemEntity> _items = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<ItemEntity> get items => UnmodifiableListView(_items);

  // 购物车中商品的总价
  double get totalPrice => _items.fold(
      0, (value, item) => value + ((item.count ?? 0) * (item.price ?? 0.0)));

  // 将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void add(ItemEntity item) {
    _items.add(item);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }
}

/// ↑↑↑↑ 正常开发使用上方的就行 ↑↑↑↑
class CartModel with ChangeNotifier, DiagnosticableTreeMixin {
  // 用于保存购物车中商品列表
  final List<ItemEntity> _items = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<ItemEntity> get items => UnmodifiableListView(_items);

  // 购物车中商品的总价
  double get totalPrice => _items.fold(
      0, (value, item) => value + ((item.count ?? 0) * (item.price ?? 0.0)));

  // 将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void add(ItemEntity item) {
    _items.add(item);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }

  /// 通过列出其所有属性使 `totalPrice` 在devtools中可读 正常不需要使用
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('totalPrice', totalPrice));
  }
}
