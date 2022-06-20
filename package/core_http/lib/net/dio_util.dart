import 'dart:convert';
import 'dart:io';
import 'package:core_http/index.dart';
import 'package:core_http/net/interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../common/http_common_constant.dart';
import '../protocol/base_resp.dart';

/// 请求方法.
class Method {
  static const String get = "GET";
  static const String post = "POST";
  static const String put = "PUT";
  static const String head = "HEAD";
  static const String delete = "DELETE";
  static const String patch = "PATCH";
}

/// dio 配置项
class HttpConfigs {
  final String? baseUrl;

  // final String? proxy;
  // final String? cookiesPath;
  final List<Interceptor>? interceptors;
  final int connectTimeout;
  final int sendTimeout;
  final int receiveTimeout;
  final Map<String, dynamic>? headers;

  HttpConfigs({
    this.baseUrl,
    this.headers,
    // this.proxy,
    // this.cookiesPath,
    this.interceptors,
    this.connectTimeout = Duration.millisecondsPerMinute,
    this.sendTimeout = Duration.millisecondsPerMinute,
    this.receiveTimeout = Duration.millisecondsPerMinute,
  });

// static DioConfig of() => Get.find<DioConfig>();
}

///Http配置.
class HttpConfig {
  /// constructor.
  HttpConfig({
    required this.status,
    required this.code,
    required this.msg,
    required this.data,
    required this.options,
    required this.interceptors,
    // required this.pem,
    // required this.pKCSPath,
    // required this.pKCSPwd,
  });

  /// BaseResp [String status]字段 key, 默认：status.
  String status;
  List<Interceptor> interceptors;

  /// BaseResp [int code]字段 key, 默认：errorCode.
  String code;

  /// BaseResp [String msg]字段 key, 默认：errorMsg.
  String msg;

  /// BaseResp [T data]字段 key, 默认：data.
  String data;

  /// Options.
  BaseOptions options;

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

  DioUtil._init() {
    _dio = Dio();
  }

  /// get dio.
  Dio getDio() => _dio ?? Dio();

  static DioUtil getInstance() => _singleton;

  factory DioUtil() => _singleton;

  // void setCookie(String cookie) {
  //   Map<String, dynamic> _headers = {};
  //   _headers["Cookie"] = cookie;
  //   _dio?.options.headers.addAll(_headers); // 添加请求头
  // }

  /// set Config.
  void setConfig(HttpConfig config) {
    _statusKey = config.status;
    _codeKey = config.code;
    _msgKey = config.msg;
    _dataKey = config.data;
    _setDefOptions(config.options);
    _setInterceptors(config.interceptors);
  }

  /// 使用选项发出 http 请求。
  /// [method] 请求方法。 默认POST请求
  /// [path] 网址路径。
  /// [data] 请求数据
  /// [options] 请求选项。
  /// <BaseResp<T> 返回 状态码消息数据。
  Future<BaseResp<T>> request<T>(String path,
      {String method = Method.post,
        data,
        Options? options,
        CancelToken? cancelToken}) async {
    Response? response = await _dio?.request(path,
        data: data,
        options: _checkOptions(method, getDefOptions()),
        cancelToken: cancelToken);
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
            type: DioErrorType.response,
            requestOptions: response.requestOptions,
          ));
        }
      }
    }

    return Future.error(DioError(
      response: response,
      type: DioErrorType.response,
      requestOptions: response!.requestOptions,
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
            type: DioErrorType.response,
            requestOptions: response.requestOptions,
          ));
        }
      }
    }
    return Future.error(DioError(
      response: response,
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
    if (response.data == null || response.data
        .toString()
        .isEmpty) {
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
  DioUtil createNewDio() => DioUtil();

  static Map<String, dynamic> header = {
    // 'engineerSession':
    //     "${HiCache.getInstance().get(GlobalConstant.masterId)}&&${HiCache.getInstance().get(GlobalConstant.sessionId)}",
  };

  /// get Def Options.
  static Options getDefOptions() {
    Options options = Options(headers: header);
    // options.contentType =
    //     ContentType.parse("application/x-www-form-urlencoded").toString();
    options.contentType = ContentType.parse("application/json").toString();
    options.receiveTimeout = 1000 * 30;
    return options;
  }

  /// get Def Options.
  static BaseOptions getDefBaseOptions() {
    BaseOptions options = BaseOptions(headers: header);
    options.contentType = ContentType.parse("application/json").toString();
    options.receiveTimeout = 1000 * 30;
    return options;
  }

  /// 设置默认选项
  void _setDefOptions(BaseOptions baseOptions) {
    if (_dio != null) {
      _dio?.options = baseOptions;
      // 添加拦截器
      if (kDebugMode) {
        _dio?.interceptors.add(AppLogInterceptor());
      }
    }
  }

  /// 设置拦截器
  void _setInterceptors(List<Interceptor> interceptor) {
    if (_dio != null) {
      _dio?.interceptors.addAll(interceptor);
    }
  }
}
