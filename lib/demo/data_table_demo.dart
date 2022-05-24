import 'package:flutter/material.dart';
import 'package:number1/model/post.dart';

class DataTableDemo extends StatefulWidget {
  const DataTableDemo({Key key}) : super(key: key);

  @override
  State<DataTableDemo> createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DataTableDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              DataTable(
                headingRowColor: MaterialStateProperty.all(
                    Colors.lightGreenAccent.withOpacity(0.4)),
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                // onSelectAll: (value) {}, //全选
                columns: [
                  DataColumn(
                    label: Text('Title'),
                    onSort: (int index, bool ascending) {
                      setState(() {
                        _sortColumnIndex = index;
                        _sortAscending = ascending;

                        posts.sort((a, b) {
                          if (!ascending) {
                            final c = a;
                            a = b;
                            b = c;
                          }

                          return a.title.length.compareTo(b.title.length);
                        });
                      });
                    },
                  ),
                  DataColumn(
                    label: Text('Author'),
                  ),
                  DataColumn(
                    label: Text('Image'),
                  ),
                ],
                rows: posts.map((post) {
                  return DataRow(
                      selected: post.selected,
                      onSelectChanged: (value) { //选择
                        setState(() {
                          if (post.selected != value) {
                            post.selected = value ?? false;
                          }
                        });
                      },
                      cells: [
                        DataCell(Text(post.title)),
                        DataCell(Text(post.author)),
                        DataCell(Image.network(post.imageUrl)),
                      ]);
                }).toList(),
              ),
            ],
          ),
        ));
  }
}
