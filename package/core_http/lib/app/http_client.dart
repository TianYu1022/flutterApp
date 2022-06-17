import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../net/dio_util.dart';
import '../protocol/base_resp.dart';
import 'app_dio.dart';

class HttpClient {
  late AppDio _dio;

  HttpClient({BaseOptions? options, HttpConfigs? dioConfig})
      : _dio = AppDio(options: options, dioConfig: dioConfig);

  /// BaseResp [String status]字段 key, 默认：status.
  final String _statusKey = "status";

  /// BaseResp [int code]字段 key, 默认：errorCode.
  final String _codeKey = "errorCode";

  /// BaseResp [String msg]字段 key, 默认：errorMsg.
  final String _msgKey = "errorMsg";

  /// BaseResp [T data]字段 key, 默认：data.
  final String _dataKey = "data";

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
    Response? response =
        await _dio.request(path, data: data, cancelToken: cancelToken);
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
      type: DioErrorType.response, requestOptions: response.requestOptions,
    ));
  }

  /// decode response data.
  Map<String, dynamic> _decodeData(Response response) {
    if (response.data == null || response.data.toString().isEmpty) {
      return {};
    }
    return json.decode(response.data.toString());
  }
}
