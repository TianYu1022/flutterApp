import 'package:flutter/cupertino.dart';

enum HttpMethod { GET, POST, DELETE }

///基础请求

abstract class BaseRequest {
  var pathParams;
  var useHttps = true;

  String authority() {
    return "api.devio.org";
  }

  HttpMethod httpMethod();

  String path();

  String url() {
    Uri uri;
    var pathStr = path();
    //拼接 path 参数
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams}";
      } else {
        pathStr = "${path()}/$pathParams}";
      }
    }
    //切换 http 和 https
    if (useHttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
    }
    debugPrint("睚眦 Request Url => $uri");
    return uri.toString();
  }

  bool needLogin();

  Map<String, String> params = {};

  ///添加参数
  BaseRequest add(String key, Object v) {
    params[key] = v.toString();
    return this;
  }

  Map<String, dynamic> header = {};

  ///添加header
  BaseRequest addHeader(String key, Object v) {
    header[key] = v.toString();
    return this;
  }
}
