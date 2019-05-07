import 'package:flutter/material.dart';

///用来变换的矩阵，总计需要16个参数也可以理解成4*4的矩阵

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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: 200,
            height: 50,
            color: Colors.green,
            child: Text('原图', style: TextStyle(fontSize: 18)),
          ),
          Container(height: 10, color: Colors.grey),
          Transform(
            transform: Matrix4.translationValues(50, 0, 0),
            //旋转点，相对于左上角顶点的偏移。默认旋转点事左上角顶点
            //是否同时变更点击有效区域
            child: Container(
              width: 200,
              height: 50,
              color: Colors.green,
              child: Text('Matrix4.translationValues(50, 0, 0)', style: TextStyle(fontSize: 18)),
            ),
          ),
          Container(height: 10, color: Colors.grey),
          Transform(
            transform: Matrix4.rotationZ(100),
            child: Container(
              width: 200,
              height: 50,
              color: Colors.green,
              child: Text('Matrix4.rotationZ(100)', style: TextStyle(fontSize: 18)),
            ),
          ),
          Container(height: 10, color: Colors.grey),
          Transform(
            transform: Matrix4.skewX(0.4),
            child: Container(
              width: 200,
              height: 50,
              color: Colors.green,
              child: Text('Matrix4.skewX(0.5)', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
