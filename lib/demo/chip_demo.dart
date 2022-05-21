import 'package:flutter/material.dart';

///碎片 label
class ChipDemo extends StatefulWidget {
  const ChipDemo({Key? key}) : super(key: key);

  @override
  State<ChipDemo> createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  var _tags = ["Apple", "Banana", "Lemon"];
  var _action = "nothing";
  var _selected = [];
  var _choice = "Lemon";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChipDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 8.0, //组件之间间距
              runSpacing: 8.0, //行间距
              children: <Widget>[
                const Chip(label: Text("Life")),
                const Chip(
                    label: Text("Sunset"), backgroundColor: Colors.orange),
                const Chip(
                    label: Text("TianYu"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.grey, child: Text("田"))),
                const Chip(
                  label: Text("TianYu......名字很长的时候的样子是用Wrap包裹这么设置的"),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "http://m.qpic.cn/psc?/V124eZU41TdanL/ruAMsa53pVQWN7FLK88i5r0J8xxlNqOu8qoKWxPTGm*kdnhdFUzbT9diFEiVoARiY0OtJx3wNzH9AyLoiEOCdCYOBxmlzCNv86XxuqTzwMA!/b&bo=OARRBgAAAAABB0s!&rf=viewer_4"),
                  ),
                ),
                Chip(
                  label: const Text("City"),
                  onDeleted: () {},
                  deleteIcon: const Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: "确定要删除吗？",
                ),
                const Divider(
                  color: Colors.grey,
                  height: 32.0,
                  indent: 18.0,
                  endIndent: 18.0,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags
                      .map(
                        (e) => Chip(
                          label: Text(e),
                          onDeleted: () {
                            setState(() {
                              _tags.remove(e);
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
                const Divider(
                  color: Colors.grey,
                  height: 32.0,
                  indent: 18.0,
                  endIndent: 18.0,
                ),
                SizedBox(
                    //动作碎片
                    width: double.infinity,
                    child: Text("chosen ActionChip is: $_action")),
                Wrap(
                  spacing: 8.0,
                  children: _tags
                      .map(
                        (e) => ActionChip(
                          label: Text(e),
                          onPressed: () {
                            setState(() {
                              _action = e;
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                    //过滤碎片
                    width: double.infinity,
                    child:
                        Text("chosen FilterChip is: ${_selected.toString()}")),
                Wrap(
                  spacing: 8.0,
                  children: _tags
                      .map(
                        (e) => FilterChip(
                          label: Text(e),
                          selected: _selected.contains(e),
                          onSelected: (value) {
                            setState(() {
                              if (_selected.contains(e)) {
                                _selected.remove(e);
                              } else {
                                _selected.add(e);
                              }
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                    //过滤碎片
                    width: double.infinity,
                    child:
                        Text("ChoiceChip is: $_choice}")),
                Wrap(
                  spacing: 8.0,
                  children: _tags
                      .map(
                        (e) => ChoiceChip(
                          label: Text(e),
                          selectedColor: Colors.lightGreenAccent,
                          selected: e == _choice,
                          onSelected: (value) {
                            setState(() {
                              _choice = e;
                            });
                          },
                        ),
                      )
                      .toList(),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = ["Apple", "Banana", "Lemon"];
            _selected = [];
          });
        },
      ),
    );
  }
}
