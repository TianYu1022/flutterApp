///需要登录的异常
class NeedLogin extends HiNetError {
  NeedLogin({int code = 401, String message = "清先登录"}) : super(code, message);
}

///需要授权的异常
class NeedAuth extends HiNetError {
  NeedAuth(String message, {int code = 403, dynamic data}) : super(code, data);
}

///网络异常统一格式类
class HiNetError implements Exception {
  final int errorCode;
  final String errorMsg;
  final dynamic data;

  HiNetError(this.errorCode, this.errorMsg, {this.data});
}
