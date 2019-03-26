import 'package:flutter/material.dart';

import 'home/home.dart';
import 'message/message.dart';
import 'more/more.dart';
import 'update/update.dart';

main() {
  runApp(MaterialApp(
    home: MainPage(),
    theme: new ThemeData(
      primaryColor: Color(0xFFC91B3A),
      backgroundColor: Color(0xFFEFEFEF),
      accentColor: Color(0xFF888888),
      textTheme: TextTheme(
        //设置Material的默认字体样式
        body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFC91B3A),
        size: 35.0,
      ),
    ),
  ));
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int currentTab = 0;
  List tabs = [
    ['首页', Icon(Icons.home)],
    ['消息', Icon(Icons.message)],
    ['更新', Icon(Icons.update)],
    ['我的', Icon(Icons.more_horiz)],
  ];
  List<Tab> navTabs = [];
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        initialIndex: currentTab, length: tabs.length, vsync: this);
    for (int i = 0; i < tabs.length; i++) {
      navTabs.add(Tab(text: tabs[i][0], icon: tabs[i][1]));
    }
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        _onTabChanged();
      }
    });
  }

  void _onTabChanged() {
    if (this.mounted) {
      setState(() {
        currentTab = tabController.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tabs[tabController.index][0])),
      body: TabBarView(controller: tabController, children: [
        HomePage(),
        MessagePage(),
        UpdatePage(),
        MorePage(),
      ]),
      bottomNavigationBar: Material(
        child: SafeArea(
            child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: const Color(0xFFd0d0d0),
                blurRadius: 3.0,
                spreadRadius: 2.0,
                offset: Offset(-1.0, -1.0),
              ),
            ],
          ),
          child: TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: const Color(0xFF8E8E8E),
              controller: tabController,
              tabs: navTabs),
        )),
      ),
    );
  }
}
