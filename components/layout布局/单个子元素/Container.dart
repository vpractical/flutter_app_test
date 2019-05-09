import 'package:flutter/material.dart';

///优先填充，然后宽高，然后适应child,没有宽高有child，适应child
///总之Container遵从parent期望宽高和child宽高和自身属性如alignment期望来确定的
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            //子view的位置 e.g.靠上左右居中.Alignment.topCenter
            //有alignment属性时组件会充满父组件，否则尽可能小
            alignment: FractionalOffset(0.4, 0.4),
            padding: EdgeInsets.all(13),
            margin: EdgeInsets.all(10),
            //背景色,和decoration不能共存
//            color: Color(0xff44aa00),
            //设置为double.infinity(无限大)撑满宽度宽度
            width: double.infinity,
            height: 160,
            //帧动画效果
//            transform: Matrix4.translationValues(-30, -30, 30),
            child: Container(
              alignment: Alignment.center,
              color: Colors.red,
              child: Text(
                'child',
                style: TextStyle(fontSize: 30),
              ),
            ),
            //修饰性
            decoration: BoxDecoration(color: Colors.green),
            //前景色，会覆盖子组件,e.g.蒙版
            foregroundDecoration: BoxDecoration(color: Color(0x40787800)),
            //额外的约束条件
            constraints: BoxConstraints(
              minHeight: 100,
              maxHeight: 160,
              minWidth: 200,
              maxWidth: double.infinity,
            ),
          ),
          Divider(height: 2, color: Colors.brown),
          Container(
            width: 300,
            height: 160,
            transform: Matrix4.translationValues(-80, -80, 30),
            child: Container(
              alignment: Alignment.center,
              color: Colors.red,
              child: Text(
                'child',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Divider(height: 2, color: Colors.brown),
        ],
      ),
    );
  }
}
