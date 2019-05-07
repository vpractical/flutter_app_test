import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('ListTile'),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text('title'),
          subtitle: Text('subTitle'),
          trailing: Text('trailing'),
          isThreeLine: false,
          //列表图块是否密集显示
          dense: true,
          //整个ListTile的padding
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          //默认true可用，false时leading，title，subTitle颜色变浅，selected无效
          enabled: true,
          //true时影响leading，title，subTitle颜色
          selected: false,
          onTap: () {
            print('onTap');
          },
          onLongPress: () {
            print('onLongPress');
          },
        ),
        Divider(
          height: 1,
          color: Colors.deepPurpleAccent,
        ),
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text('title'),
          subtitle: Text('subTitle'),
          trailing: Text('trailing'),
          isThreeLine: false,
          dense: false,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          enabled: true,
          selected: true,
          onTap: () {
            print('onTap');
          },
          onLongPress: () {
            print('onLongPress');
          },
        ),
        Divider(
          height: 1,
          color: Colors.deepPurpleAccent,
        ),
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text('title'),
          trailing: Icon(Icons.navigate_next),
          isThreeLine: false,
          dense: false,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          enabled: false,
          selected: false,
          onTap: () {
            print('onTap');
          },
          onLongPress: () {
            print('onLongPress');
          },
        ),
        Divider(
          height: 1,
          color: Colors.deepPurpleAccent,
        ),
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text('title'),
          subtitle: Text('subTitle'),
          trailing: Text('trailing'),
          isThreeLine: true,
          dense: false,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          enabled: true,
          selected: false,
          onTap: () {
            print('onTap');
          },
          onLongPress: () {
            print('onLongPress');
          },
        ),
        Divider(
          height: 1,
          color: Colors.deepPurpleAccent,
        ),
      ],
    );
  }
}
