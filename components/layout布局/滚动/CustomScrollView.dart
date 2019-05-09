import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

///SliverList: 显示线性子列表
///SliverFixedExtentList: 显示沿滚动轴具有相同范围的子元素的线性列表,效率较高
///SliverGrid
///SliverPadding: 有padding的sliver
///
///SliverToBoxAdapter: slivers属性只接受sliver控件，想加入Text等，用这个包裹就行
void main() {
  runApp(MaterialApp(
    home: Scaffold(
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
    return Container(
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        //内容不足时，是否尝试滚动,true时保存???
        primary: false,
        physics: ClampingScrollPhysics(),
        //填满parent还是适应child大小,不希望child的高度固定时用
        shrinkWrap: false,
        //???
//        center: ,
        anchor: 0,
        //预加载区域
        cacheExtent: 30,
//        semanticChildCount: ,
        dragStartBehavior: DragStartBehavior.start,
        controller: ScrollController(),
        slivers: <Widget>[
          SliverAppBar(
            title: Text('CustomScrollView'),
            pinned: true,
            expandedHeight: 220.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/images/cover_img.jpg', fit: BoxFit.cover),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  child: Text('item $index'),
                );
              },
              childCount: 5,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  child: Text('item $index'),
                );
              },
              childCount: 9,
            ),
          ),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 20)),
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(3, (i) => Text('item $i')),
            ),
          ),
          SliverToBoxAdapter(
            child: Text('TTTTTTTT-SliverToBoxAdapter'),
          ),
        ],
      ),
    );
  }
}
