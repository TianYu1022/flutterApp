import 'package:flutter/material.dart';
import 'package:number1/demo/provider/inherited_provider.dart';

/// @author：TianYu
/// @describe：
/// createTime：2022/6/26 16:35

/// 继承StatefulWidget，然后定义了一个of()静态方法供子类方便获取Widget树中的InheritedProvider中保存的共享状态(model)
class TyChangeNotifierProvider<T extends ChangeNotifier>
    extends StatefulWidget {
  const TyChangeNotifierProvider({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final T data;

  /// 定义一个便捷方法，方便子树中的widget获取共享数据
//添加一个listen参数，表示是否建立依赖关系
  static T of<T>(BuildContext context, {bool listen = true}) {
    // final type = _typeOf<InheritedProvider<T>>();
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<TyInheritedProvider<T>>()
        : context
            .getElementForInheritedWidgetOfExactType<TyInheritedProvider<T>>()
            ?.widget as TyInheritedProvider<T>;
    return provider!.data;
  }

  @override
  createState() => _TyChangeNotifierProviderState<T>();
}

/// _ChangeNotifierProviderState类的主要作用就是监听到共享状态（model）改变时重新构建Widget树。
/// 在_ChangeNotifierProviderState类中调用setState()方法，
/// widget.child始终是同一个，所以执行build时，
/// InheritedProvider的child引用的始终是同一个子widget，
/// 所以widget.child并不会重新build，这也就相当于对child进行了缓存！
/// 如果ChangeNotifierProvider父级Widget重新build时，则其传入的child便有可能会发生变化。
class _TyChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<TyChangeNotifierProvider<T>> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() => {});
  }

  @override
  void didUpdateWidget(TyChangeNotifierProvider<T> oldWidget) {
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // 移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TyInheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
