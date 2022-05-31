import 'package:flutter/material.dart';
import 'package:number1/project/http/core/hi_error.dart';
import 'package:number1/project/http/core/hi_net_adapter.dart';
import 'package:number1/project/http/core/mock_adapter.dart';
import 'package:number1/project/http/request/base_request.dart';

class HiNet {
  HiNet._();

  static HiNet? _instance;

  static HiNet getInstance() {
    return _instance ??= HiNet._();
  }

  Future fire(BaseRequest request) async {
    HiNetResponse? response;
    var error;
    try {
      response = await send(request);
    } on HiNetError catch (e) {
      error = e;
      response = e.data;
      logD(e.message);
    } catch (e) {
      //其他异常
      error = e;
      logD(e);
    }

    if (response == null) {
      logD(error);
    }

    var result = response?.data;
    logD("result => $result");

    var status = response?.statusCode ?? 0;
    switch (status) {
      case 200:
        return result;

      case 401:
        throw NeedLogin();

      case 403:
        throw NeedAuth(result.toString(), data: result);

      default:
        throw HiNetError(status, result.toString(), data: result);
    }
  }

  Future<dynamic> send<T>(BaseRequest request) async {
    logD("url => ${request.url()}");
    MockAdapter mockAdapter = MockAdapter();
    return mockAdapter.send(request);
  }

  void logD(log) {
    debugPrint("睚眦 hi_net => ${log.toString()}");
  }
}
