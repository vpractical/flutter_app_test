import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

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
        slivers: <Widget>[
          SliverAppBar(
            //leading: Icon(Icons.access_alarms),
            title: Text('SliverAppBar'),
            //centerTitle: false,
            //actions: <Widget>[Icon(Icons.map)],
            backgroundColor: Theme.of(context).accentColor,
            //bottom: PreferredSize(child: Text('bottom'), preferredSize: Size(50, 50)),
            //elevation: ,
            //automaticallyImplyLeading: true,
            //是否在header和appBar底部显示阴影效果
            forceElevated: false,
            //是否随着滑动隐藏标题,与snap结合使用，true时只要下滑就展开header,默认false
            floating: false,
            //appBar是否固定在顶部
            pinned: false,
            //与floating结合使用
            snap: false,
            //brightness: ,
            //this.iconTheme: ,
            //this.actionsIconTheme: ,
            //this.textTheme: ,
            //this.primary: true,
            //SliverAppBar高度
            expandedHeight: 220.0,
            //显示在 AppBar 下方的控件，高度和 AppBar 高度一样，可以实现一些特殊的效果，该属性通常在 SliverAppBar 中使用
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
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item $index'),
                );
              },
              childCount: 15,
            ),
          ),
        ],
//        semanticChildCount: ,
        dragStartBehavior: DragStartBehavior.start,
        controller: ScrollController(),
      ),
    );
  }
}
