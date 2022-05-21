import 'package:flutter/material.dart';

///收缩面板
class ExpansionPanelDemo extends StatefulWidget {
  const ExpansionPanelDemo({Key? key}) : super(key: key);

  @override
  State<ExpansionPanelDemo> createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  var _isExpanded = false; //是否展开
  late List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    super.initState();
    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
          headerText: "Panel A",
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text("Content for Panel A."),
          ),
          isExpanded: false),
      ExpansionPanelItem(
          headerText: "Panel B",
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text("Content for Panel B."),
          ),
          isExpanded: false),
      ExpansionPanelItem(
          headerText: "Panel C",
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text("Content for Panel C."),
          ),
          isExpanded: false),
      ExpansionPanelItem(
          headerText: "Panel D",
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text("Content for Panel D."),
          ),
          isExpanded: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpansionPanelDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int panelIndex, bool isExpanded) {
                setState(() {
                  _expansionPanelItems[panelIndex].isExpanded = !isExpanded;
                });
              },
              children: _expansionPanelItems
                  .map((e) => ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        //头部
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(e.headerText,
                              style: Theme.of(context).textTheme.titleSmall),
                        );
                      },
                      body: e.body,
                      isExpanded: e.isExpanded))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    required this.headerText,
    required this.body,
    required this.isExpanded,
  });
}
