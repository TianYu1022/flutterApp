import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import '../net/dio_util.dart';

class AppDio with DioMixin implements Dio {
  AppDio({BaseOptions? options, HttpConfigs? dioConfig}) {
    options ??= BaseOptions(
      baseUrl: dioConfig?.baseUrl ?? "",
      // contentType: 'application/x-www-form-urlencoded',
      contentType: 'application/json; charset=UTF-8',
      connectTimeout: dioConfig?.connectTimeout,
      sendTimeout: dioConfig?.sendTimeout,
      receiveTimeout: dioConfig?.receiveTimeout,
    )..headers = dioConfig?.headers;
    this.options = options;

    // if (kDebugMode) {
    //   interceptors.add(AppLogInterceptor());
    // }
    if (dioConfig?.interceptors?.isNotEmpty ?? false) {
      interceptors.addAll(dioConfig!.interceptors!);
    }
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  setProxy(String proxy) {
    (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      // config the http client
      client.findProxy = (uri) {
        // proxy all request to localhost:8888
        return "PROXY $proxy";
      };
      return null;
      // you can also create a HttpClient to dio
      // return HttpClient();
    };
  }
}
