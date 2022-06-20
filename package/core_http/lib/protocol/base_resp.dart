import 'package:dio/dio.dart';

/// <BaseResp<T> 返回 status code message data.
class BaseResp<T> {
  int? status;
  String? version;
  String? message;
  T? data;

  BaseResp({this.status, this.version, this.message, this.data});

  /// BaseResp(int status, T data, String message, String version);

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write("\"status\":\"$status\"");
    sb.write(",\"version\":$version");
    sb.write(",\"message\":\"$message\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}

/// <BaseRespR<T> 返回 status code message data Response.
class BaseRespR<T> {
  int? status;
  String? version;
  String? message;
  T? data;
  Response response;

  BaseRespR(this.response,
      {this.status, this.data, this.message, this.version});

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write("\"status\":\"$status\"");
    sb.write(",\"version\":$version");
    sb.write(",\"message\":\"$message\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}
