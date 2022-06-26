import 'package:flutter/material.dart';
import 'package:number1/demo/provider/change_notifier_provider.dart';

/// @author：TianYu
/// @describe：这是一个便捷类，会获得当前context和指定数据类型的Provider
/// createTime：2022/6/26 17:14
class TyConsumer<T> extends StatelessWidget {
  const TyConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      TyChangeNotifierProvider.of<T>(context), //自动获取Model
    );
  }
}
