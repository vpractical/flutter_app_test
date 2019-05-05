import 'package:flutter/material.dart';

main() {
  List<PopupMenuItem> list = [
    PopupMenuItem(
      child: Text('item'),
      value: 123,
    ),
    PopupMenuItem(
      child: Text('item'),
      value: 123,
    ),
    PopupMenuItem(
      child: Text('item'),
      value: 123,
    ),
  ];

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(),
      body: PopupMenuButton(
        itemBuilder: (context) => list,
//        child: Text('PopupMenuButton'),//child和icon不能共存
        icon: Icon(Icons.ac_unit),
        offset: Offset(70, 70), //控制弹出菜单的位置偏移量
        elevation: 8,
        padding: EdgeInsets.all(50),
        tooltip: 'tooltip',
        onCanceled: () => print('onCanceled'),
        onSelected: (select) => print('onSelected=$select'),
        initialValue: list.first,
      ),
    ),
  ));
}
