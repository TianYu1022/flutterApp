import 'package:dio/dio.dart';
import 'package:number1/project/http/core/hi_error.dart';
import 'package:number1/project/http/core/hi_net_adapter.dart';
import 'package:number1/project/http/request/base_request.dart';

///dio适配器
class DioAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) async {
    Response? response;
    Options options = Options(headers: request.header);
    var error;
    try {
      if (request.httpMethod() == HttpMethod.GET) {
        response = await Dio().get(request.url(), options: options);
      } else if (request.httpMethod() == HttpMethod.POST) {
        response = await Dio()
            .post(request.url(), data: request.params, options: options);
      } else if (request.httpMethod() == HttpMethod.DELETE) {
        response = await Dio()
            .delete(request.url(), data: request.params, options: options);
      }
    } on DioError catch (e) {
      error = e;
      response = e.response;
    }

    if (error != null) {
      ///抛出HiNetError
      throw HiNetError(response?.statusCode ?? -1, error.toString(),
          data: buildRes(response, request));
    }

    return buildRes(response, request);
  }

  ///构建HiNetResponse
  buildRes(Response? response, BaseRequest request) {
    return HiNetResponse(
        data: response?.data,
        request: request,
        statusCode: response?.statusCode ?? -1,
        statusMessage: response?.statusMessage ?? "statusMessage 为空 !",
        extra: response);
  }

  //A value of type 'Type' can't be returned from the method 'buildRes' because it has a return type of 'Future<HiNetResponse<dynamic>>'.

//无法从方法“buildRes”返回类型为“Type”的值，因为它的返回类型为“Future<HiNetResponse<dynamic>>”
  //无法从方法“buildRes”返回类型为“Type”的值，因为它的返回类型为“Future<HiNetResponse<dynamic>>”。
}
