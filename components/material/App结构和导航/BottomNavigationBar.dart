import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 1;

  var _items = [
    BottomNavigationBarItem(
        backgroundColor: Colors.green,
        icon: Icon(
          Icons.ac_unit,
        ),
        title: Text("tab1")),
    BottomNavigationBarItem(
        backgroundColor: Colors.blue,
        icon: Icon(
          Icons.ac_unit,
        ),
        title: Text("tab2")),
    BottomNavigationBarItem(
      backgroundColor: Colors.red,
      icon: Icon(
        Icons.ac_unit,
      ),
      title: Text("tab3"),
      activeIcon: Icon(Icons.arrow_forward), //item选中时显示这个icon
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _currentIndex,
        //选中第几个
        elevation: 20,
        //阴影，好像没效果
        type: BottomNavigationBarType.shifting,
        //fixed:均分宽度，选中略微变大,shifting:选中的占更大空间,showUnselectedLabels默认值不一样
//        fixedColor: Colors.black, //取得selectedItemColor的值,和selectedItemColor不能同时使用
        backgroundColor: Colors.redAccent,
        //如果type=shifting&item设置了bg，item的bg将覆盖nav的bg,??item未设置bg是nav的bg不生效
        iconSize: 25,
        //item的icon大小
        selectedItemColor: Colors.deepPurple, //和fixedColor不能同时使用
        unselectedItemColor: Colors.amber,
        selectedFontSize: 20,
        unselectedFontSize: 14,
        showSelectedLabels: true, //默认显示选中item的title
        showUnselectedLabels: true, //type=fixed默认显示未选中item的title，type=shifting默认false不显示
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
