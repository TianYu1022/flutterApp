import 'dart:convert';
import 'dart:io';

import 'package:core_http/index.dart';
import 'package:core_http/net/interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common/http_common_constant.dart';
import '../protocol/base_resp.dart';

/**
 * @Author: thl
 * @GitHub: https://github.com/Sky24n
 * @JianShu: https://www.jianshu.com/u/cbf2ad25d33a
 * @Email: 863764940@qq.com
 * @Description: Dio Util.
 * @Date: 2018/12/19
 */

/// 请求方法.
class Method {
  static const String get = "GET";
  static const String post = "POST";
  static const String put = "PUT";
  static const String head = "HEAD";
  static const String delete = "DELETE";
  static const String patch = "PATCH";
}

///Http配置.
class HttpConfig {
  /// constructor.
  HttpConfig({
    required this.status,
    required this.code,
    required this.msg,
    required this.data,
    // required this.options,
    // required this.pem,
    // required this.pKCSPath,
    // required this.pKCSPwd,
  });

  /// BaseResp [String status]字段 key, 默认：status.
  String status;

  /// BaseResp [int code]字段 key, 默认：errorCode.
  String code;

  /// BaseResp [String msg]字段 key, 默认：errorMsg.
  String msg;

  /// BaseResp [T data]字段 key, 默认：data.
  String data;

  /// Options.
// Options options;

  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PEM证书内容.
// String pem;

  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PKCS12 证书路径.
// String pKCSPath;

  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PKCS12 证书密码.
// String pKCSPwd;
}

/// 单例 DioUtil.
/// debug模式下可以打印请求日志. DioUtil.openDebug().
/// dio详细使用请查看dio官网(https://github.com/flutterchina/dio).
class DioUtil {
  static final DioUtil _singleton = DioUtil._init();
  static Dio? _dio;

  /// BaseResp [String status]字段 key, 默认：status.
  String _statusKey = "status";

  /// BaseResp [int code]字段 key, 默认：errorCode.
  String _codeKey = "errorCode";

  /// BaseResp [String msg]字段 key, 默认：errorMsg.
  String _msgKey = "errorMsg";

  /// BaseResp [T data]字段 key, 默认：data.
  String _dataKey = "data";

  /// Options.
  Options _options = getDefOptions();

  /// PEM证书内容.
  // String _pem;

  /// PKCS12 证书路径.
  // String _pKCSPath;

  /// PKCS12 证书密码.
  // String _pKCSPwd;

  /// 是否是debug模式.
  static bool _isDebug = false;

  DioUtil._init() {
    _dio = Dio();
  }

  /// get dio.
  Dio getDio() => _dio ?? Dio();

  static DioUtil getInstance() => _singleton;

  factory DioUtil() => _singleton;

  /// 打开debug模式.
  static void openDebug() => _isDebug = true;

  // void setCookie(String cookie) {
  //   Map<String, dynamic> _headers = {};
  //   _headers["Cookie"] = cookie;
  //   _dio?.options.headers.addAll(_headers); // 添加请求头
  // }

  /// set Config.
  DioUtil setConfig(HttpConfig config) {
    _statusKey = config.status;
    _codeKey = config.code;
    _msgKey = config.msg;
    _dataKey = config.data;

    setDefOptions();
    // _mergeOption();
    // _pem = config.pem ?? _pem;
    if (_dio != null) {
      // _dio?.options = _options;
      // if (_pem != null) {
      //   _dio.onHttpClientCreate = (HttpClient client) {
      //     client.badCertificateCallback =
      //         (X509Certificate cert, String host, int port) {
      //       if (cert.pem == _pem) {
      //         // 证书一致，则放行
      //         return true;
      //       }
      //       return false;
      //     };
      //   };
      // }
      // if (_pKCSPath != null) {
      //   _dio.onHttpClientCreate = (HttpClient client) {
      //     SecurityContext sc = new SecurityContext();
      //     //file为证书路径
      //     sc.setTrustedCertificates(_pKCSPath, password: _pKCSPwd);
      //     HttpClient httpClient = new HttpClient(context: sc);
      //     return httpClient;
      //   };
      // }
    }
    return DioUtil();
  }

  /// merge Option.
  // void _mergeOption(Options opt) {
  //   _dio?.options.method = _options.method = opt.method ?? _options.method;
  //   _options.headers = (new Map.from(_options.headers))..addAll(opt.headers);
  //   _options.baseUrl = opt.baseUrl ?? _options.baseUrl;
  //   _options.connectTimeout = opt.connectTimeout ?? _options.connectTimeout;
  //   _options.receiveTimeout = opt.receiveTimeout ?? _options.receiveTimeout;
  //   _options.responseType = opt.responseType ?? _options.responseType;
  //   _options.data = opt.data ?? _options.data;
  //   _options.extra = (new Map.from(_options.extra))..addAll(opt.extra);
  //   _options.contentType = opt.contentType ?? _options.contentType;
  //   _options.validateStatus = opt.validateStatus ?? _options.validateStatus;
  //   _options.followRedirects = opt.followRedirects ?? _options.followRedirects;
  // }

  /// 使用选项发出 http 请求。
  /// [method] 请求方法。
  /// [path] 网址路径。
  /// [data] 请求数据
  /// [options] 请求选项。
  /// <BaseResp<T> 返回 状态码消息数据。
  Future<BaseResp<T>> request<T>(String method, String path,
      {data, Options? options, CancelToken? cancelToken}) async {
    Response? response = await _dio?.request(path,
        data: data,
        options: _checkOptions(method, options),
        cancelToken: cancelToken);
    // _printHttpLog(response);
    String _status;
    int _code;
    String _msg;
    T _data;
    if (response != null) {
      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        try {
          if (response.data is Map) {
            _status = (response.data[_statusKey] is int)
                ? response.data[_statusKey].toString()
                : response.data[_statusKey];
            _code = (response.data[_codeKey] is String)
                ? int.tryParse(response.data[_codeKey])
                : response.data[_codeKey];
            _msg = response.data[_msgKey];
            _data = response.data[_dataKey];
          } else {
            Map<String, dynamic> _dataMap = _decodeData(response);
            _status = (_dataMap[_statusKey] is int)
                ? _dataMap[_statusKey].toString()
                : _dataMap[_statusKey];
            _code = (_dataMap[_codeKey] is String)
                ? int.tryParse(_dataMap[_codeKey])
                : _dataMap[_codeKey];
            _msg = _dataMap[_msgKey];
            _data = _dataMap[_dataKey];
          }
          return BaseResp(_status, _code, _msg, _data);
        } catch (e) {
          return Future.error(DioError(
            response: response,
            // message: "data parsing exception...",
            type: DioErrorType.response,
            requestOptions: response.requestOptions,
          ));
        }
      }
    }

    return Future.error(DioError(
      response: response,
      // message: "statusCode: $response.statusCode, service error",
      type: DioErrorType.response, requestOptions: response!.requestOptions,
    ));
  }

  /// 使用选项发出 http 请求。
  /// [method] 请求方法。
  /// [path] 网址路径。
  /// [data] 请求数据
  /// [options] 请求选项。
  /// <BaseRespR<T> 返回 状态码消息数据响应。
  Future<BaseRespR<T>> requestR<T>(String method, String path,
      {data, Options? options, CancelToken? cancelToken}) async {
    Response? response = await _dio?.request(path,
        data: data,
        options: _checkOptions(method, options),
        cancelToken: cancelToken);
    // _printHttpLog(response);
    String _status;
    int _code;
    String _msg;
    T _data;
    if (response != null) {
      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        try {
          if (response.data is Map) {
            _status = (response.data[_statusKey] is int)
                ? response.data[_statusKey].toString()
                : response.data[_statusKey];
            _code = (response.data[_codeKey] is String)
                ? int.tryParse(response.data[_codeKey])
                : response.data[_codeKey];
            _msg = response.data[_msgKey];
            _data = response.data[_dataKey];
          } else {
            Map<String, dynamic> _dataMap = _decodeData(response);
            _status = (_dataMap[_statusKey] is int)
                ? _dataMap[_statusKey].toString()
                : _dataMap[_statusKey];
            _code = (_dataMap[_codeKey] is String)
                ? int.tryParse(_dataMap[_codeKey])
                : _dataMap[_codeKey];
            _msg = _dataMap[_msgKey];
            _data = _dataMap[_dataKey];
          }
          return BaseRespR(_status, _code, _msg, _data, response);
        } catch (e) {
          return Future.error(DioError(
            response: response,
            // message: "data parsing exception...",
            type: DioErrorType.response,
            requestOptions: response.requestOptions,
          ));
        }
      }
    }
    return Future.error(DioError(
      response: response,
      // message: "statusCode: $response.statusCode, service error",
      type: DioErrorType.response,
      requestOptions: response!.requestOptions,
    ));
  }

  /// Download the file and save it in local. The default http method is "GET",you can custom it by [Options.method].
  /// [urlPath]: The file url.
  /// [savePath]: The path to save the downloading file later.
  /// [onProgress]: The callback to listen downloading progress.please refer to [OnDownloadProgress].
  // Future<Response> download(
  //     String urlPath,
  //     savePath, {
  //       OnDownloadProgress onProgress,
  //       CancelToken cancelToken,
  //       data,
  //       Options options,
  //     }) {
  //   return _dio.download(urlPath, savePath,
  //       onProgress: onProgress,
  //       cancelToken: cancelToken,
  //       data: data,
  //       options: options);
  // }

  /// decode response data.
  Map<String, dynamic> _decodeData(Response response) {
    if (response.data == null || response.data.toString().isEmpty) {
      return {};
    }
    return json.decode(response.data.toString());
  }

  /// check Options.
  Options _checkOptions(method, options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  /// print Http Log.
  // void _printHttpLog(Response response) {
  //   if (!_isDebug) {
  //     return;
  //   }
  //   try {
  //     debugPrint("----------------Http Log----------------\n[statusCode]:   ${response.statusCode}\n[request   ]:   " +
  //         _getOptionsStr(response.request));
  //     _printDataStr("reqdata ", response.request.data);
  //     _printDataStr("response", response.data);
  //   } catch (ex) {
  //     debugPrint("Http Log" + " error......");
  //   }
  // }

  /// get Options Str.
  // String _getOptionsStr(Options request) {
  //   return "method: " +
  //       request.method +
  //       "  baseUrl: " +
  //       request.baseUrl +
  //       "  path: " +
  //       request.path;
  // }

  /// print Data Str.
  void _printDataStr(String tag, Object value) {
    String da = value.toString();
    while (da.isNotEmpty) {
      if (da.length > 512) {
        debugPrint("[$tag  ]:   ${da.substring(0, 512)}");
        da = da.substring(512, da.length);
      } else {
        debugPrint("[$tag  ]:   $da");
        da = "";
      }
    }
  }

  /// create new dio.
  // static Dio createNewDio([Options options]) {
  //   options = options;
  //   Dio dio = Dio();
  //   return dio;
  // }
  DioUtil createNewDio() {
    return DioUtil();
  }

  /// get Def Options.
  static Options getDefOptions() {
    Options options = Options();
    options.contentType =
        ContentType.parse("application/x-www-form-urlencoded").toString();
    // options.connectTimeout = 1000 * 30;
    options.receiveTimeout = 1000 * 30;
    return options;
  }

  static setDefOptions() {
    if (_dio != null) {
      _dio?.options.baseUrl = HttpCommonConstant.baseUrl;
      _dio?.options.contentType =
          ContentType.parse("application/x-www-form-urlencoded").toString();
      _dio?.options.receiveTimeout = 1000 * 30;
      _dio?.options.baseUrl = "http://www.wanandroid.com";

      // 添加迭代器
      if (kDebugMode) {
        _dio?.interceptors.add(AppLogInterceptor());
      }
    }
  }
}
