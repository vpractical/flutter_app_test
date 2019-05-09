import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Row-Column'),
      ),
      body: Body(),
    ),
  ));
}

///优先填充，然后宽高，然后适应child,没有宽高有child，适应child
///总之Container遵从parent期望宽高和child宽高和自身属性如alignment期望来确定的
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      color: Colors.redAccent,
      child: Container(
        height: 300,
        width: 300,
        color: Colors.grey,
        child: Stack(
          //AlignmentDirectional.center = FractionalOffset(0.5, 0.5)
          alignment: FractionalOffset(0, 0.5),
          textDirection: TextDirection.ltr,
          //如何确定没有使用 Position 包裹的子组件的大小，可选值有：
          //StackFit.loose：子组件宽松取值，可以从 min 到 max。
          //StackFit.expand：子组件取最大值。
          //StackFit.passthrough：不改变子组件约束条件
          //测试结果：除了loose时child是给定大小，其他都是最上层child填充父组件
          fit: StackFit.loose,
          //超出部分的处理方式,测试没效果
          overflow: Overflow.clip,
          children: <Widget>[
            Positioned(
              child: Text('Stack'),
              top: 20,
              left: 20,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.deepPurpleAccent,
            ),
            Container(
              width: 70,
              height: 70,
              color: Colors.cyan,
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.lightGreen,
            ),
            Positioned(
              left: 200,
              top: 80,
              //比Stack多index属性，控制显示哪个child
              child: IndexedStack(
                index: 1,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.deepPurpleAccent,
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    color: Colors.cyan,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.lightGreen,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
