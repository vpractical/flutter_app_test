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

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
//        MainAxisSize mainAxisSize = MainAxisSize.max,
//    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
//    TextDirection textDirection,
//    VerticalDirection verticalDirection = VerticalDirection.down,
//    TextBaseline textBaseline,
    return Column(
//      mainAxisAlignment: ,
//      mainAxisSize: ,
//      crossAxisAlignment: ,
//      verticalDirection: ,
//      textDirection: ,
//      textBaseline: ,
      children: <Widget>[
        Container(
          color: Colors.lightBlueAccent,
          height: 50,
          child: Row(
            //MainAxisAlignment：<主轴>方向上的对齐方式，会对child的位置起作用，默认是start。
            //center：将children放置在主轴的中心；
            //end：将children放置在主轴的末尾；
            //spaceAround：将主轴上的空白区域均分，children间的空白区域相等，首尾child的空白区域为1/2；
            //spaceBetween：将主轴上的空白区域均分，children间的空白区域相等，首尾child没有间隙；
            //spaceEvenly：将主轴上的空白区域均分，children间的空白区域相等，包括首尾child；
            //start：将children放置在主轴的起点；
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //在主轴方向占有空间的值，默认是max最大化，min时最小化这时mainAxisAlignment无效
            mainAxisSize: MainAxisSize.max,
            //children在<交叉轴>方向的对齐方式:
            //baseline：在交叉轴方向，使得children的baseline对齐；
            //center：children在交叉轴上居中展示；
            //end：children在交叉轴上末尾展示；
            //start：children在交叉轴上起点处展示；
            //stretch：让children填满交叉轴方向；
            crossAxisAlignment: CrossAxisAlignment.center,
            //children摆放顺序，默认是down从top到bottom进行布局
            verticalDirection: VerticalDirection.down,
            //阅读顺序
            textDirection: TextDirection.ltr,
            //见于Baseline组件
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Container(height: 30, width: 50, color: Colors.green),
              Container(height: 30, width: 50, color: Colors.yellow),
              Container(height: 30, width: 50, color: Colors.deepPurple),
            ],
          ),
        ),
        Container(height: 40, color: Colors.lightGreen),
        //row.column继承自Flex，仅direction不同
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(height: 30, width: 50, color: Colors.green),
            Container(height: 30, width: 50, color: Colors.yellow),
            Container(height: 30, width: 50, color: Colors.deepPurple),
          ],
        ),
      ],
    );
  }
}
