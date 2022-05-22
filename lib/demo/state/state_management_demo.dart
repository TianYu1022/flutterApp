import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  const StateManagementDemo({Key? key}) : super(key: key);

  @override
  State<StateManagementDemo> createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  var _count = 0;

  void _onClickListener() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      onClickListener: _onClickListener,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0.0,
        ),
        body: CounterWrapper(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _onClickListener,
        ),
      ),
    );
  }
}


class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CounterDemo(),
    );
  }
}

class CounterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var count = CounterProvider.of(context).count;
    var onClickListener = CounterProvider.of(context).onClickListener;
    return ActionChip(
      label: Text("$count"),
      onPressed: onClickListener,
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback onClickListener;

  const CounterProvider({
    required this.count,
    required this.onClickListener,
    Key? key,
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