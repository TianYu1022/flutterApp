import 'dart:io';
import 'package:core_http/index.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// @author：TianYu
/// @describe：
/// createTime：2022/6/20 14:43
class HttpManger {
  /// 使用选项发出 http 请求。
  /// [path] 网址路径。
  /// [method] 请求方法。 默认POST请求
  /// [reqData] 请求数据
  /// [options] 请求选项。
  /// [isShowLoading]
  /// [requestStart] 开始请求 返回请求参数。
  /// [requestEnd] 请求结束 返回返回值。
  /// [error] 请求失败。
  /// <BaseResp<T> 返回 状态码消息数据。
  static Future<BaseResp<T>> request<T>(
    String path, {
    String method = Method.post,
    reqData,
    Options? options,
    bool isShowLoading = true,
    Function(T)? requestStart,
    Function()? requestEnd,
    Function(Object d)? error,
  }) async {
    return await DioUtil().request<T>(path, method: method, reqData: reqData,
        requestStart: (reqData) {
      if (isShowLoading) {
        EasyLoading.show(status: '加载中...');
      }
    }, requestEnd: (BaseResp? res) {
      if (isShowLoading) {
        EasyLoading.dismiss();
      }
    }, error: (e) {});
  }

  /// 初始化 Http
  static initHttp() {
    DioUtil()
        .setConfig(HttpConfig(
            status: "errorCode",
            message: "errorMsg",
            data: "data",
            version: "version",
            options: DioUtil.getDefOptions()))
        .setBaseOptions(BaseOptions(
            baseUrl: "http://www.wanandroid.com",
            contentType: ContentType.parse("application/json").toString(),
            receiveTimeout: 1000 * 30))
        .addLoggerInterceptor();
  }
}
