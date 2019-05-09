import 'package:flutter/material.dart';

///ListBody在主轴上，子节点按照顺序进行布局，在交叉轴上，子节点尺寸会被拉伸，以适应交叉轴的区域。
///ListBody在主轴上，给予子节点的空间必须是不受限制的，使得子节点可以全部被容纳，ListBody不会去裁剪或者缩放其子节点。
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('ListBody'),
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
  List<Widget> _views = [];

  @override
  void initState() {
    super.initState();
    int a = 0;
    while (a < 10) {
      _views.add(Container(
        color: Colors.green,
        width: 200,
        child: Text('item:$a'),
      ));
      a++;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_views.length);
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: Colors.grey,
        child: ListBody(
          mainAxis: Axis.vertical,
          reverse: false,
          children: _views,
        ),
      ),
    );
  }
}
