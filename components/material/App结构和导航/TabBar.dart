import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

///NeverScrollablePhysics呈现不可滚动的列表。使用此选项可以完全禁用ListView的滚动
///当列表结束时，BouncingScrollPhysics会弹回列表。在iOS上使用类似的效果
///ClampingScrollPhysics,Android上使用的默认滚动物理。列表在结尾处停止并给出指示的水波纹效果
///FixedExtentScrollPhysics这与此列表中的其他内容略有不同，因为它仅适用于FixedExtendScrollControllers和使用它们的列表。
///如采用ListWheelScrollView来制作类似轮子的列表.
void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 300,
          child: MaterialApp(
            home: App(),
          ),
        ),
        Container(
          height: 20,
          color: Colors.grey,
        ),
        Expanded(
          child: MaterialApp(
            home: App2(),
          ),
          flex: 1,
        ),
      ],
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  TabController _tabController;

  var _tabs = [
    Center(
      child: Text('tab1'),
    ),
    Text('tab2'),
    Text('tab3'),
    Text('tab4'),
  ];

  var _views = [
    Text('view1'),
    Text('view2'),
    Text('view3'),
    Text('view4'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 1, length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.ac_unit),
        title: TabBar(
          tabs: _tabs,
          controller: _tabController,
          isScrollable: false,
          //是否可滚动,
//          indicator: BoxDecoration(
//            color: Colors.yellow,
//          ),//指示器
          indicatorColor: Colors.red,
          indicatorWeight: 5,
          //指示器高度,断言不能小于0
          indicatorPadding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.tab,
          //指示器宽度，label和文字等宽，tab和item等宽
          labelColor: Colors.black,
          //文字颜色
          labelPadding: EdgeInsets.all(5),
          //文字外边距，如调整和指示器的距离等
          labelStyle: TextStyle(backgroundColor: Colors.greenAccent),
          unselectedLabelColor: Colors.white,
          unselectedLabelStyle: TextStyle(),
          dragStartBehavior: DragStartBehavior.down,
          onTap: (index) {
            if (index != 0) return;
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Center(heightFactor: 3, child: Text('index = $index'));
                });
          },
        ),
      ),
      body: TabBarView(
        children: _views,
        controller: _tabController,
        dragStartBehavior: DragStartBehavior.down, //拖动开始时的行文方式，没看出不同不明白
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}

class App2 extends StatefulWidget {
  @override
  _App2State createState() => _App2State();
}

class _App2State extends State<App2> with SingleTickerProviderStateMixin {
  TabController _tabController;

  var _tabs = [
    Text('tab1'),
    Text('tab2'),
    Text('tab3'),
    Text('tab4'),
  ];

  var _views = [
    Text('view1'),
    Text('view2'),
    Text('view3'),
    Text('view4'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 1, length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.ac_unit),
        title: Icon(Icons.ac_unit),
        backgroundColor: Colors.deepPurpleAccent,
        bottom: TabBar(
          tabs: _tabs,
          controller: _tabController,
          isScrollable: false, //是否可滚动,
          indicator: BoxDecoration(
            color: Colors.yellow,
          ),
        ),
      ),
      body: TabBarView(
        children: _views,
        controller: _tabController,
        dragStartBehavior: DragStartBehavior.start,
        physics: ClampingScrollPhysics(),
      ),
    );
  }
}
