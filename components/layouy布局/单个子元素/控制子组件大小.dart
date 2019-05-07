import 'package:flutter/material.dart';

///FittedBox : 有fit属性，根据fit属性调整子组件大小
///AspectRatio : 将子widget的大小指定为某个特定的长宽比
///ConstrainedBox : 额外约束条件，最大最小宽高
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('FittedBox'),
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
          color: Colors.grey,
          width: 200,
          height: 120,
          child: FittedBox(
            fit: BoxFit.fill,
            alignment: Alignment.center,
            child: Container(
              color: Colors.red,
              //这时textSize无效
              child: Text("FittedBox:fontSize无效"),
            ),
          ),
        ),
        Container(height: 5),
        Container(
          color: Colors.green,
          height: 80,
          //AspectRatio父容器给单个宽度或高度
          child: AspectRatio(
            aspectRatio: 4,
            child: Container(
              color: Colors.red,
              child: Text("AspectRatio:宽高比4:1", style: TextStyle(fontSize: 30)),
            ),
          ),
        ),
        Container(height: 5),
        Container(
          child: ConstrainedBox(
            //额外的约束条件
            constraints: BoxConstraints(
              minHeight: 60,
              maxHeight: 160,
              minWidth: 200,
              maxWidth: double.infinity,
            ),
            child: Container(
              color: Colors.green,
              child: Text('ConstrainedBox额外约束\n最大最小宽高', style: TextStyle(fontSize: 30)),
            ),
          ),
        ),
      ],
    );
  }
}
