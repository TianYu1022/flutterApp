import 'package:number1/project/http/core/hi_net_adapter.dart';
import 'package:number1/project/http/request/base_request.dart';

///测试适配器 mock 数据
class MockAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) {
    Map data = {"code": 0, "message": "success"};
    return Future.delayed(const Duration(milliseconds: 1000), () {
      return HiNetResponse(
          data: data, request: request, statusCode: 403, statusMessage: "");
    });
  }
}
