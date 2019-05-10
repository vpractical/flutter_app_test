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
  var _tabs = ['aa', 'aa', 'aa', 'aa'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: _tabs.length,
        child: NestedScrollView(
          //建造一个先于body滚动的组件
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              //包裹住一个组件，使其接受NestedScrollView的协调去滚动
              SliverOverlapAbsorber(
                //SliverOverlapAbsorber,SliverOverlapsInjector,NestedScrollViewViewViewport跟随NestedScrollView的协调
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  title: Text('NestedScrollView'),
                  pinned: true,
                  expandedHeight: 220,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset('assets/images/cover_img.jpg', fit: BoxFit.cover),
                  ),
                  bottom: TabBar(
                    tabs: _tabs.map((String name) => Text(name, style: TextStyle(fontSize: 30))).toList(),
                    labelColor: Colors.red,
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: _tabs.map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                        ),
                        SliverFixedExtentList(
                          itemExtent: 48.0,
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return ListTile(
                                title: Text('Item $index'),
                              );
                            },
                            childCount: 20,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
