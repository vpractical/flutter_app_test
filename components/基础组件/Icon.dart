import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Icon'),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FlutterLogo(size: 80),
        Icon(Icons.access_alarms, size: 80),
        //ImageProvider类型图片
        ImageIcon(AssetImage('assets/images/shake.png'), size: 80),
        //???测试时没加载出来图片
        ImageIcon(
          NetworkImage(
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2102088240,2728155711&fm=26&gp=0.jpg',
          ),
          size: 80,
        ),
      ],
    );
  }
}
