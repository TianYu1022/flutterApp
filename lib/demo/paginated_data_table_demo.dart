import 'package:flutter/material.dart';
import 'package:number1/model/post.dart';

class PaginatedDataTableDemo extends StatefulWidget {
  const PaginatedDataTableDemo({Key key}) : super(key: key);

  @override
  State<PaginatedDataTableDemo> createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  var _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PaginatedDataTableDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              PaginatedDataTable(
                header: Text("Posts"),
                source: _postDataSource,
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                // onSelectAll: (value) {}, //全选
                columns: [
                  DataColumn(
                    label: Text('Title'),
                    onSort: (int columnIndex, bool ascending) {
                      _postDataSource._sort((post) => post.title.length, ascending);

                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
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
              ),
            ],
          ),
        ));
  }
}

class PostDataSource extends DataTableSource {
  var _posts = posts;
  var _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    var post = _posts[index];

    return DataRow.byIndex(cells: <DataCell>[
      DataCell(Text(post.title)),
      DataCell(Text(post.author)),
      DataCell(Image.network(post.imageUrl)),
    ], index: index);
  }

  @override
  bool get isRowCountApproximate => false; //不确定行的时候返回true

  @override
  int get rowCount => _posts.length;

  @override
  int get selectedRowCount => _selectedCount;

  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        var c = a;
        a = b;
        b = c;
      }
      var aValue = getField(a);
      var bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}
