import 'package:core_http/app/api_manager.dart';
import 'package:rxdart/rxdart.dart';
import 'bloc_provider.dart';

class ApplicationBloc implements BlocBase {
  final BehaviorSubject<List<BannerModel>> _appEvent = BehaviorSubject();

  Sink<List<BannerModel>> get _appEventSink => _appEvent.sink;

  Stream<List<BannerModel>> get appEventStream => _appEvent.stream;

  Future? getBannerList() async {
    return ApiManager.instance
        .getBanner(ReqData(name: "田宇", sex: "男", age: 18).toJson())
        .then((data) => _appEventSink.add(data));
  }

  @override
  void dispose() {
    _appEvent.close();
  }

  @override
  Future? getData({String? labelId, int? page}) {
    return getBannerList();
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
