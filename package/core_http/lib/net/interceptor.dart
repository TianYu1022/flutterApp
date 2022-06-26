/// @author：TianYu
/// @describe：拦截器
/// createTime：2022/6/17 02:32
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppLogInterceptor extends Interceptor {
  static const bool _debugMode = !bool.fromEnvironment("dart.vm.product");
  static const String _defTag = 'AppLogInterceptor';
  static const String _tagValue = _defTag;
  static const int _maxLen = 128;

  late DateTime _startTime;
  late DateTime _endTime;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _startTime = DateTime.now();
    // 此处根据业务逻辑，自行增加 requestUrl requestMethod headers queryParameters 等参数的打印
    logD(
        "—————————————————————————————————— 🚀 Request Start 🚀 —————————————————————————————————— ");
    logD("<-- URL -- ${options.uri}");
    if (options.data != null) {
      logD(json.encode(options.data), tag: "<-- 入参 ");
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _endTime = DateTime.now();
    final int duration = _endTime.difference(_startTime).inMilliseconds;
    logD(json.encode(response.data), tag: "<-- 200 ");
    logD(
        "———————————————————————————— Request End: 耗时 $duration 毫秒 —————————————————————————————");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logD("---request Error: ${err.toString()}");
    super.onError(err, handler);
  }

  ///打印debug日志
  void logD(Object object, {String tag = ""}) {
    if (_debugMode) {
      _printLog(tag, ' d ', object);
    }
  }

  void _printLog(String tag, String stag, Object object) {
    String da = object.toString();
    if (tag.isEmpty) {
      tag = _tagValue;
    }
    if (da.length <= _maxLen) {
      debugPrint('$tag$stag $da');
      return;
    }
    debugPrint(
        '$tag$stag ╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════');
    while (da.isNotEmpty) {
      if (da.length > _maxLen) {
        debugPrint('$tag$stag ║ ${da.substring(0, _maxLen)}');
        da = da.substring(_maxLen, da.length);
      } else {
        debugPrint('$tag$stag ║ $da');
        da = '';
      }
    }
    debugPrint(
        '$tag$stag ╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════');
  }
}
