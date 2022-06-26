import 'package:core_tools/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:number1/demo/provider/change_notifier_provider.dart';
import 'package:number1/demo/provider/consumer.dart';
import 'package:number1/demo/provider/demo/cart_model.dart';
import 'package:number1/demo/provider/demo/item_entity.dart';
import 'package:provider/provider.dart';

/// Flutter Provider的主要功能
/// 1、数据共享 2、局部刷新
class ProviderDemo extends StatefulWidget {
  const ProviderDemo({Key? key}) : super(key: key);

  @override
  State<ProviderDemo> createState() => _ProviderDemoState();
}

class _ProviderDemoState extends State<ProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ProviderDemo"),
          elevation: 0.0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TyChangeNotifierProvider<TyCartModel>(
                data: TyCartModel(),
                child: Builder(builder: (context) {
                  return Column(
                    children: <Widget>[
                      TyConsumer<TyCartModel>(
                        builder: (context, cart) =>
                            Text("总价: ${cart.totalPrice}"),
                      ),
                      Builder(builder: (context) {
                        LogUtils.d("不需要重新构建 => RaisedButton build", tag: "睚眦");
                        return ElevatedButton(
                          child: const Text("添加商品"),
                          onPressed: () {
                            //给购物车中添加商品，添加后总价会更新
                            TyChangeNotifierProvider.of<TyCartModel>(context,
                                    listen: false)
                                .add(ItemEntity(price: 20.0, count: 1));
                          },
                        );
                      }),
                    ],
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Center(
              child: TyChangeNotifierProvider<TyCartModel>(
                data: TyCartModel(),
                child: Builder(builder: (context) {
                  return Column(
                    children: <Widget>[
                      Text(
                          "总价 provider : ${context.watch<CartModel>().totalPrice}"),
                      ElevatedButton(
                        child: const Text("使用provider的方式实现添加商品"),
                        onPressed: () {
                          //给购物车中添加商品，添加后总价会更新
                          context
                              .read<CartModel>()
                              .add(ItemEntity(price: 20.0, count: 1));
                        },
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ));
  }
}
