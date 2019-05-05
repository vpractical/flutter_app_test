import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
//        leading: Icon(Icons.ac_unit),
        automaticallyImplyLeading: false, //leading不为空此参数无效，为空时true=自动推断leading，如有drawer时会自动显示icon，false=不推断
        //标题栏返回按钮位置的一个icon
        title: Text('AppBar'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.ac_unit), onPressed: null),
          IconButton(icon: Icon(Icons.ac_unit), onPressed: null),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text('menu1'),
              ),
              PopupMenuItem(
                child: Text('menu2'),
              ),
            ];
          })
        ],
        //一个 Widget 列表，代表 Toolbar 中所显示的菜单，对于常用的菜单，通常使用 IconButton 来表示；对于不常用的菜单通常使用 PopupMenuButton 来显示为三个点，点击后弹出二级菜单
//        flexibleSpace: Text('flexibleSpace'), //一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样，可以实现一些特殊的效果，该属性通常在 SliverAppBar 中使用
        bottom: PreferredSize(
//            child: TabBar(),
            child: Text('PreferredSize'),
            preferredSize: Size(100, 60)), //一个 AppBarBottomWidget 对象，通常是 TabBar。用来在 Toolbar 标题下面显示一个 Tab 导航栏
        elevation: 0,
//          shape: null,
        backgroundColor: Colors.cyan, //默认值为 ThemeData.primaryColor。改值通常和下面的三个属性一起使用
//        brightness: ,//亮度，有白色和黑色两种主题，默认值为 ThemeData.primaryColorBrightness
//        iconTheme: ,//图标的颜色、透明度、和尺寸信息。默认值为 ThemeData.primaryIconTheme
//        actionsIconTheme:,//菜单icon样式
//        textTheme: ,//文字样式。默认值为 ThemeData.primaryTextTheme
        centerTitle: false, //title是否居中，默认android=false，ios=true
        primary: true, //默认为true将显示到状态栏下面，false和状态栏重叠
        titleSpacing: NavigationToolbar.kMiddleSpacing,
        bottomOpacity: 0.5, //标题栏的底部的透明度，值1.0是完全不透明的，值0.0是完全透明的,多用于sliverappbar
        toolbarOpacity: 0.5, //标题栏透明度，多用于sliverappbar
      ),
      body: Text('body'),
      drawer: Text('.....'),
    ),
  ));
}
