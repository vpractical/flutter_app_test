import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('ProgressIndicator'),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        LinearProgressIndicator(),
        LinearProgressIndicator(
          //value 为空显示一个动画,否则显示一个定值,只能设置0~1，大于1表示已经结束
          value: 0.3,
          backgroundColor: Colors.lightGreen,
          //走过的进度的颜色,这个api???
          valueColor: AlwaysStoppedAnimation(Colors.redAccent),
          semanticsLabel: 'semanticsLabel',
          semanticsValue: 'semanticsValue',
        ),
        CircularProgressIndicator(
          strokeWidth: 2,
        ),
        CircularProgressIndicator(
          strokeWidth: 4,
          value: 0.7,
          //属性无效
          backgroundColor: Colors.lightGreen,
          valueColor: AlwaysStoppedAnimation(Colors.redAccent),
        ),
        RefreshProgressIndicator(),
        RefreshProgressIndicator(
          value: 0.7,
          backgroundColor: Colors.lightGreen,
          valueColor: AlwaysStoppedAnimation(Colors.redAccent),
        ),
      ],
    );
  }
}
