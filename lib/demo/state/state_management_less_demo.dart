import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class StateManagementLessDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementScopedModelDemo'),
          elevation: 0.0,
        ),
        body: CounterWrapper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false, //默认会被重建
          builder: (context, _, model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.increaseCount,
          ),
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
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => ActionChip(
        label: Text("${model._count}"),
        onPressed: model.increaseCount,
      ),
    );
  }
}

class CounterModel extends Model {
  var _count = 0;

  get count => _count;

  void increaseCount() {
    //增加计数
    _count++;
    notifyListeners();
  }
}