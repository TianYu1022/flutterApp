import 'package:number1/project/http/core/hi_net_adapter.dart';
import 'package:number1/project/http/request/base_request.dart';

///测试适配器 mock 数据
class MockAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) {
    Map data = {"errorCode": 0, "errorMsg": "success"};
    return Future.delayed(const Duration(milliseconds: 1000), () {
      return HiNetResponse(
          data: data, request: request, errorCode: 403, errorMsg: "");
    });
  }
}
