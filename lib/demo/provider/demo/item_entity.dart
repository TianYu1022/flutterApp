import 'package:flutter/material.dart';

/// @author：TianYu
/// @describe：
/// createTime：2022/6/26 16:50
class ItemEntity {
  double? price;
  int? count;

  ItemEntity({this.price, this.count});

  ItemEntity.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['count'] = count;
    return data;
  }
}
