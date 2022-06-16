import 'dart:convert';

import 'package:number1/project/http/request/base_request.dart';

///网络层抽象类
abstract class HiNetAdapter {
  Future<HiNetResponse<T>> send<T>(BaseRequest request);
}

///统一网络层返回格式
class HiNetResponse<T> {
  HiNetResponse(
      {required this.request,
      required this.data,
      required this.errorCode,
      required this.errorMsg,
      this.extra});

  BaseRequest request;

  dynamic data;
  int errorCode;
  String errorMsg;
  dynamic extra;

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}
