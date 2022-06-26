import 'package:core_http/net/dio_util.dart';
import 'package:core_http/protocol/base_resp.dart';
import 'package:core_tools/log_utils.dart';
import 'package:module_http/base/http_manger.dart';
import 'package:rxdart/rxdart.dart';
import 'bloc_provider.dart';
import 'models.dart';

class ApplicationBloc implements BlocBase {
  ///文章
  final BehaviorSubject<List<ReposModel>> _repos =
      BehaviorSubject<List<ReposModel>>();

  Sink<List<ReposModel>> get _reposSink => _repos.sink;

  Stream<List<ReposModel>> get reposStream => _repos.stream;

  Future getArticleListData() {
    return getArticleListProject().then((value) => _reposSink.add(value));
  }

  Future<List<ReposModel>> getArticleListProject() async {
    BaseResp<Map<String, dynamic>> baseResp =
        await HttpManger.request<Map<String, dynamic>>(
            "/article/listproject/0/json",
            method: Method.get);
    List<ReposModel> list;
    if (baseResp.status != 0) {
      return Future.error(baseResp.message ?? "");
    }
    ComData comData = ComData.fromJson(baseResp.data!);
    list = comData.datas.map((value) {
      return ReposModel.fromJson(value);
    }).toList();
    return list;
  }

  @override
  void dispose() {
    _repos.close();
  }

  @override
  Future? getData({String? labelId, int? page}) {
    return getArticleListData();
  }

  @override
  Future? onLoadMore({String? labelId}) {
    return null;
  }

  @override
  Future? onRefresh({String? labelId}) {
    return null;
  }
}
