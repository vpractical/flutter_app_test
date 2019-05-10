import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

///```
///List.generate(5, (i){
///   _data.add(i);
///});
///```
///onRefresh: _refresh:(Function对象), _refresh():(Future对象),属性需要前者

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
//      body: BodySeparated(),
//      body: BodyCustom(),
//      body: BodyBuilder(),
      body: BodyRefreshLoadMore(),
      drawer: Body(),
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
      color: Colors.grey,
      child: ListView(
        scrollDirection: Axis.vertical,
        reverse: false,
        controller: ScrollController(),
        //ListView在滚动方向上每个item所占的高度值
        itemExtent: 50,
        //内容不足时，是否尝试滚动
        primary: false,
        //滑动到终点时的效果,!item不满一屏时必须AlwaysScrollableScrollPhysics，否则不能刷新
        physics: BouncingScrollPhysics(),
        //填满parent还是适应child大小,不希望child的高度固定时用
        shrinkWrap: false,
        padding: EdgeInsets.all(10),
        //???
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: true,
        addSemanticIndexes: true,
        //预加载区域
        cacheExtent: 40,
        //辅助功能会用到
//      semanticChildCount: ,
        dragStartBehavior: DragStartBehavior.start,
        children: <Widget>[
          Text('item1\n123'),
          Text('item2\n123'),
          Text('item2\n123'),
          Text('item2\n123'),
          Text('item2\n123'),
          Text('item2\n123'),
          Text('item2\n123'),
        ],
      ),
    );
  }
}

class BodyRefreshLoadMore extends StatefulWidget {
  @override
  _BodyRefreshLoadMoreState createState() => _BodyRefreshLoadMoreState();
}

class _BodyRefreshLoadMoreState extends State<BodyRefreshLoadMore> {
  ScrollController _scrollController = ScrollController();
  List<int> _data = [];
  int _page = 0;

  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var maxScroll = _scrollController.position.maxScrollExtent;
      var pixels = _scrollController.position.pixels;
      if (maxScroll == pixels && _data.length < 20) {
        _loadMore();
      }
    });
    _refresh();
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      _data.clear();
      _page = 1;
      List.generate(10, (i) {
        _data.add(i);
      });
      setState(() {});
    });
  }

  _loadMore() async {
    await Future.delayed(Duration(seconds: 2), () {
      List.generate(10, (i) {
        _data.add(_page * 10 + i);
      });
      _page++;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        //触发下拉刷新的距离
        displacement: 40,
        //进度指示器前景色 默认为系统主题色
        color: Colors.red,
        backgroundColor: Colors.green,
//        semanticsLabel: ,
//        semanticsValue: ,
        notificationPredicate: (notify) {
          print('notificationPredicate：$notify');
          //输出：ScrollUpdateNotification(depth: 0 (local), FixedScrollMetrics(369.2..[603.4]..503.4), scrollDelta: 1.1383928571428328, DragUpdateDetails(Offset(0.0, -1.1)))
          return true;
        },
        //下拉回调方法,方法需要有async和await关键字
        onRefresh: _refresh,
        child: ListView.separated(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (index == _data.length) {
              return Center(
                child: RefreshProgressIndicator(),
              );
            }
            return ListTile(
              title: Text('item: $index'),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(color: Colors.grey);
          },
          itemCount: _data.length + 1,
        ),
      ),
    );
  }
}

class BodySeparated extends StatefulWidget {
  @override
  _BodySeparatedState createState() => _BodySeparatedState();
}

class _BodySeparatedState extends State<BodySeparated> {
  @override
  Widget build(BuildContext context) {
    //设置分割线,可以用来设置mulitType
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index == 2) {
          return ListTile(title: Text('--------------------我是分割线:index$index-----------------'));
        }
        if (index == 5) {
          return ListTile(title: Text('mulitType:item:$index'));
        }
        return ListTile(title: Text('item$index'));
      },
      separatorBuilder: (context, index) {
        return Container(height: 3, color: Colors.deepPurpleAccent);
      },
      itemCount: 10,
    );
  }
}

class BodyBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) => Text('item:$index'),
    );
  }
}

class BodyCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //较为底层的方法
    return ListView.custom(
      childrenDelegate: SliverChildDelegateImpl((context, index) {
        return ListTile(
          title: Text('custom:item$index'),
        );
      }, childCount: 15),
    );
  }
}

class SliverChildDelegateImpl extends SliverChildBuilderDelegate {
  SliverChildDelegateImpl(
    Widget Function(BuildContext, int) builder, {
    int childCount,
  }) : super(
          builder,
          childCount: childCount,
        );

  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    super.didFinishLayout(firstIndex, lastIndex);
  }
}
