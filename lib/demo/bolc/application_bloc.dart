import 'dart:collection';

import 'package:number1/demo/bolc/bloc_provider.dart';
import 'package:number1/demo/click_button_demo.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc implements BlocBase {
  final BehaviorSubject<List<BannerModel>> _appEvent = BehaviorSubject();

  Sink<List<BannerModel>> get _appEventSink => _appEvent.sink;

  Stream<List<BannerModel>> get appEventStream => _appEvent.stream;
  final WanRepository _wanRepository = WanRepository();

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

  Future? getBannerList() async {
    return _wanRepository.getBanner().then((list) {
      _appEventSink.add(UnmodifiableListView(list));
    });
  }
}
