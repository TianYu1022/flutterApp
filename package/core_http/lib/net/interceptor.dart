/// @author：TianYu
/// @describe：拦截器
/// createTime：2022/6/17 02:32
import 'dart:convert';

import 'package:core_http/common/http_common_constant.dart';
import 'package:core_tools/json_utils.dart';
import 'package:core_tools/log_utils.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 此处根据业务逻辑，自行判断处理
    if ('token' != '') {
      options.headers['token'] = 'token';
    }
    super.onRequest(options, handler);
  }
}

class AppLogInterceptor extends Interceptor {
  late DateTime _startTime;
  late DateTime _endTime;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _startTime = DateTime.now();
    // 此处根据业务逻辑，自行增加 requestUrl requestMethod headers queryParameters 等参数的打印
    LogUtils.d(
        "—————————————————————————————————— 🚀 Request Start 🚀 —————————————————————————————————— ");
    LogUtils.d("<-- URL -- ${HttpCommonConstant.baseUrl}${options.path}");
    LogUtils.d("<-- 入参 -- ${json.encode(options.data)}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _endTime = DateTime.now();
    final int duration = _endTime.difference(_startTime).inMilliseconds;
    LogUtils.d(json.encode(response.data), tag: "<-- 200 ");
    LogUtils.d(
        "———————————————————————————— Request End: 耗时 $duration 毫秒 —————————————————————————————");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    LogUtils.d("---request Error: ${err.toString()}");
    super.onError(err, handler);
  }
}
