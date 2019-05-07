import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('DataTable'),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          DataTable(
            //排序列索引
            sortColumnIndex: 0,
            //升序排序,有个向上向下箭头
            sortAscending: false,
            //全选
            onSelectAll: (bool) {
              print('onSelectAll:$bool');
            },
            columns: <DataColumn>[
              DataColumn(
                label: GestureDetector(
                  onTap: () {
                    print('column 1 tap');
                  },
                  child: Text('column 1'),
                ),
                tooltip: 'Tooltip',
                //是否包含数字,影响箭头和表格位置啥的
                numeric: false,
                //排序时调用
//                onSort: null,
              ),
              DataColumn(label: Text('column 2')),
              DataColumn(label: Text('column 3')),
            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text('cell 1'),
                    onTap: () {
                      print('cell 1 tap');
                    },
                    //true时cell后方有个代表可编辑的笔
                    showEditIcon: true,
                    //false时淡色显示
                    placeholder: true,
                  ),
                  DataCell(Text('cell 2')),
                  DataCell(Text('cell 3')),
                ],
              ),
              DataRow(
                selected: false,
                onSelectChanged: (bool) {},
                cells: <DataCell>[
                  DataCell(Text('cell 4')),
                  DataCell(Text('cell 5')),
                  DataCell(Text('cell 6')),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
