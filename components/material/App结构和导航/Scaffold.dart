import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

///显示 snackBar 或者 bottom sheet 的时候，需要使用当前的 BuildContext 参数调用 Scaffold.of 函数来获取 ScaffoldState 对象，
///然后使用 ScaffoldState.showSnackBar 和 ScaffoldState.showBottomSheet 函数来显示。
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scaffold'),
        ),
        //显示在界面顶部的一个 AppBar
        body: Text('body'),
        //当前界面所显示的主要内容 Widget
        floatingActionButton: FloatingActionButton(onPressed: () {
          print('floatingActionButton click');
        }),
//        floatingActionButtonLocation: null, //悬浮按钮位置
//        floatingActionButtonAnimator: null,//悬浮按钮在[floatingActionButtonLocation]出现/消失动画
        persistentFooterButtons: <Widget>[
          Text('persistentFooterButtons1'),
          Text('persistentFooterButtons2'),
        ], //在底部呈现一组button，显示于[bottomNavigationBar]之上，[body]之下
        //固定在下方显示的按钮，比如对话框下方的确定、取消按钮
        drawer: Text('左边栏'),
        //左边栏
        endDrawer: Text('右边栏'),
        //右边栏
        bottomSheet: BottomSheet(
            onClosing: () {},
            builder: (BuildContext context) {
//              showModalBottomSheet(
//                  context: context,
//                  builder: (context) {
//                    return Text('bbbbbbbbbbb222222222');
//                  });
              return Text('bottomSheet');
            }),
        //底部滑出的组件,通常很少直接使用 BottomSheet 而是使用 showModalBottomSheet
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text('tab1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text('tab2'),
          )
        ]),
        //底部导航栏
        backgroundColor: Colors.cyan,
        resizeToAvoidBottomPadding: true, //控制界面内容 body是否重新布局来避免底部被覆盖了，比如当键盘显示的时候，重新布局避免被键盘盖住内容。默认值为 true
        resizeToAvoidBottomInset: false, //重新计算布局空间大小
        primary: true, //默认为true将显示到状态栏下面，false和状态栏重叠
        drawerDragStartBehavior: DragStartBehavior.start,
      ), //布局的容器,架子
    ),
  );
}

//this.extendBody = false,
