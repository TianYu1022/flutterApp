import 'package:flutter/material.dart';

import 'counter_home.dart';

class BlocDemo extends StatefulWidget {
  const BlocDemo({Key? key}) : super(key: key);

  @override
  State<BlocDemo> createState() => _BlocDemoState();
}

class _BlocDemoState extends State<BlocDemo> {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("BlocDemo"),
          elevation: 0.0,
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}