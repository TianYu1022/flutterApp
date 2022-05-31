class TestEntity {
  int? code;
  Data? data;
  String? msg;

  TestEntity({this.code, this.data, this.msg});

  TestEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = this.msg;
    return data;
  }
}

class Data {
  int? code;
  String? method;
  String? requestPrams;

  Data({this.code, this.method, this.requestPrams});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    method = json['method'];
    requestPrams = json['requestPrams'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['method'] = this.method;
    data['requestPrams'] = this.requestPrams;
    return data;
  }
}
