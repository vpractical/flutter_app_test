import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Chip'),
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
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Chip(
            label: Text('label'),
            avatar: Icon(Icons.ac_unit),
            labelStyle: TextStyle(color: Colors.redAccent),
            labelPadding: EdgeInsets.all(3),
            deleteIcon: Icon(Icons.delete_outline),
            //为空时不显示删除图标
            onDeleted: () {
              print('delete');
            },
            deleteIconColor: Colors.brown,
            //deleteIcon长按的tip文字
            deleteButtonTooltipMessage: 'deleteButtonTooltipMessage',
            //形状.默认两端是半圆形
            shape: RoundedRectangleBorder(
                side: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(6))),
            clipBehavior: Clip.hardEdge,
            backgroundColor: Colors.lightGreen,
            padding: EdgeInsets.all(8),
            elevation: 8,
            shadowColor: Colors.redAccent,
            //默认padded距离顶部有个距离，shrinkWrap没有
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}
