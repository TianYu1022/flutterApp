import 'package:flutter/material.dart';
import 'package:module_http/base/http_manger.dart';
import 'package:number1/project/db/hi_cache.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// @author DFK
/// @since 2022/05/29
/// @desc 全局变量存储
/// @remark
class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await HiCache.preInit(); //初始化SP
    HttpManger.initHttp();
    initEasyLoading();
    HttpManger.initHttp(); // 初始化网络请求环境配置
  }

  // 初始化弹窗配置
  static initEasyLoading() {
    EasyLoading.instance.indicatorSize = 33;
    EasyLoading.instance.fontSize = 12;
    EasyLoading.instance.maskType = EasyLoadingMaskType.clear;
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance.indicatorColor = Colors.white;
    EasyLoading.instance.backgroundColor = Colors.white.withOpacity(0.4);
    EasyLoading.instance.textColor = Colors.white;
  }
}
// class ProfileChangeNotifier extends ChangeNotifier {
//   // Profile get _profile => Global.prefs;
//   @override
//   void notifyListeners() {
//     Global.prefs; //保存Profile变更
//     super.notifyListeners(); //通知依赖的Widget更新
//   }
// }
