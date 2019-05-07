import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('SimpleDialog'),
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
        Row(
          //MainAxisAlignment：主轴方向上的对齐方式，会对child的位置起作用，默认是start。
          //center：将children放置在主轴的中心；
          //end：将children放置在主轴的末尾；
          //spaceAround：将主轴上的空白区域均分，children间的空白区域相等，首尾child的空白区域为1/2；
          //spaceBetween：将主轴上的空白区域均分，children间的空白区域相等，首尾child没有间隙；
          //spaceEvenly：将主轴上的空白区域均分，children间的空白区域相等，包括首尾child；
          //start：将children放置在主轴的起点；
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('阙歌'),
            Text('离歌'),
            Text('可歌'),
          ],
        ),
        Row(),
        Row(),
      ],
    );
  }
}
//MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
//    MainAxisSize mainAxisSize = MainAxisSize.max,
//CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
//    TextDirection textDirection,
//VerticalDirection verticalDirection = VerticalDirection.down,
//    TextBaseline textBaseline,
