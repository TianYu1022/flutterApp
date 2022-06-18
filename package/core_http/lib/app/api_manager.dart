import 'package:core_http/common/http_common_constant.dart';
import 'package:core_http/net/interceptor.dart';
import '../protocol/base_resp.dart';
import '../net/dio_util.dart';
import 'http_client.dart';

class ApiManager {
  factory ApiManager() => _getInstance();

  static ApiManager get instance => _getInstance();

  static ApiManager? _instance;

  ApiManager._internal();

  static ApiManager _getInstance() {
    _instance ??= ApiManager._internal();
    return _instance!;
  }

  HttpClient? client;

  static Map<String, dynamic> header = {
    //请求头
    // 'engineerSession':
    //     "${HiCache.getInstance().get(GlobalConstant.masterId)}&&${HiCache.getInstance().get(GlobalConstant.sessionId)}",
  };

  initClient() async {
    HttpConfigs dioConfig = HttpConfigs(
        // baseUrl: HttpCommonConstant.baseUrl,
        headers: header,
        interceptors: [AppLogInterceptor()]);

    client = HttpClient(dioConfig: dioConfig);
  }

  HttpClient getClient() {
    if (client == null) {
      throw Exception("请在第一个网络请求之前先调用initClient()方法初始化clint");
    }
    return client!;
  }

  Future<List<BannerModel>> getBanner(Map<dynamic, dynamic> json) async {
    BaseResp<List> baseResp = await getClient()
        .request<List>("/banner/json", method: Method.get, data: json);
    List<BannerModel> bannerList;
    if (baseResp.code != 0) {
      return Future.error(baseResp.msg);
    }
    bannerList = baseResp.data.map((value) {
      return BannerModel.fromJson(value);
    }).toList();
    return bannerList;
  }
}

class BannerModel {
  String? desc;
  int? id;
  String? imagePath;
  int? isVisible;
  int? order;
  String? title;
  int? type;
  String? url;

  BannerModel(
      {this.desc,
      this.id,
      this.imagePath,
      this.isVisible,
      this.order,
      this.title,
      this.type,
      this.url});

  BannerModel.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    id = json['id'];
    imagePath = json['imagePath'];
    isVisible = json['isVisible'];
    order = json['order'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['desc'] = desc;
    data['id'] = id;
    data['imagePath'] = imagePath;
    data['isVisible'] = isVisible;
    data['order'] = order;
    data['title'] = title;
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}

class ReqData {
  var name = "";
  var sex = "男";
  var age = 18;

  ReqData({required this.name, required this.sex, required this.age});

  /// jsonDecode(jsonStr) 方法中会调用实体类的这个方法。如果实体类中没有这个方法，会报错。
  Map toJson() {
    Map map = {};
    map["name"] = name;
    map["sex"] = sex;
    map["age ="] = age;
    return map;
  }
}
