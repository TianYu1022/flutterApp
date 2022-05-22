import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _counterBloc = CounterProvider.of(context).bloc;

    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
              label: Text("${snapshot.data}"),
              onPressed: () {
                _counterBloc.counter.add(1);
              });
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      onPressed: () {
        _counterBloc.counter.add(1);
      },
      child: Icon(Icons.add),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final CounterBloc bloc;

  const CounterProvider({
    Key? key,
    required this.bloc,
    required Widget child,
  }) : super(key: key, child: child);

  static CounterProvider of(BuildContext context) {
    final CounterProvider? result =
        context.dependOnInheritedWidgetOfExactType<CounterProvider>();
    assert(result != null, 'No CounterProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}

class CounterBloc {
  final _countActionController = StreamController<int>();

  StreamSink<int> get counter => _countActionController.sink;

  int _count = 0;
  final _counterController = StreamController<int>();

  Stream<int> get count => _counterController.stream;

  CounterBloc() {
    _countActionController.stream.listen(onData);
  }

  void onData(int data) {
    _count = _count + data;
    _counterController.add(_count);
  }

  void Disponse() {
    _countActionController.close();
    _counterController.close();
  }
}
