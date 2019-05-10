import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('GridView')),
      body: Body(),
    ),
  ));
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

///  * [SliverGridDelegateWithFixedCrossAxisCount], which creates a layout with
///    a fixed number of tiles in the cross axis.
///  * [SliverGridDelegateWithMaxCrossAxisExtent], which creates a layout with
///    tiles that have a maximum cross-axis extent.
class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        //child宽高是给定值,但实际宽度是协调屏幕宽度计算列数后得到的相近值
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
        ),
        //child是固定数量
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          //交叉轴item数量，即gv有几列
//          crossAxisCount: 4,
//          //子view宽高比
//          childAspectRatio: 1,
//          //列间距
//          crossAxisSpacing: 10,
//          //行间距
//          mainAxisSpacing: 10,
//        ),
        scrollDirection: Axis.vertical,
        reverse: false,
        controller: ScrollController(),
        //内容不足时，是否尝试滚动
        primary: false,
        physics: BouncingScrollPhysics(),
        shrinkWrap: false,
        padding: EdgeInsets.all(10),
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: true,
        addSemanticIndexes: true,
        cacheExtent: 30,
        children: List.generate(
          25,
          (i) => Container(
                child: Text('index: $i'),
                color: Colors.grey,
              ),
        ),
      ),
    );
  }
}
