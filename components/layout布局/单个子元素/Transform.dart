import 'package:flutter/material.dart';

///Matrix4.zero() 不绘制了

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Transform'),
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
      children: <Widget>[
        Container(
            width: 200,
            height: 50,
            color: Colors.green,
            child: Text('Transform原图', style: TextStyle(fontSize: 18))),
        Container(height: 10),
        Transform(
          transform: Matrix4.translationValues(50, 0, 0),
          //旋转点，相对于左上角顶点的偏移。默认旋转点事左上角顶点
          origin: Offset(0, 0),
          alignment: Alignment.center,
          //是否同时变更点击有效区域
          transformHitTests: true,
          child: Container(
            width: 200,
            height: 50,
            color: Colors.green,
            child: Text('Matrix4.translationValues(50, 0, 0)', style: TextStyle(fontSize: 18)),
          ),
        ),
        Transform(
          transform: Matrix4.rotationZ(100),
          //旋转点，相对于左上角顶点的偏移。默认旋转点事左上角顶点
          origin: Offset(0, 0),
          alignment: Alignment.center,
          //是否同时变更点击有效区域
          transformHitTests: true,
          child: Container(
            width: 200,
            height: 50,
            color: Colors.green,
            child: Text('Matrix4.rotationZ(100)', style: TextStyle(fontSize: 18)),
          ),
        ),
      ],
    );
  }
}
