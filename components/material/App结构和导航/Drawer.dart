import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            MDrawerHeader(),
            MUserAccountsDrawerHeader(),
            Container(
              color: Colors.grey,
            )
          ],
        ),
        elevation: 22,
        semanticLabel: 'semanticLabel',
      ),
    ),
  ));
}

class MDrawerHeader extends StatefulWidget {
  @override
  _MDrawerHeaderState createState() => _MDrawerHeaderState();
}

class _MDrawerHeaderState extends State<MDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(color: Colors.redAccent),
//      margin: EdgeInsets.all(10),//marginTop是从状态栏上面开始算,默认有个marginBottom=8
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      //默认16，设为0解决状态栏问题
      child: Container(
        color: Colors.yellowAccent,
        child: Center(
          child: Icon(Icons.ac_unit),
        ),
      ),
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn, //decoration发生变化后，变化曲线curve和动画时间duration做一个切换动画
    );
  }
}

class MUserAccountsDrawerHeader extends StatefulWidget {
  @override
  _MUserAccountsDrawerHeaderState createState() => _MUserAccountsDrawerHeaderState();
}

class _MUserAccountsDrawerHeaderState extends State<MUserAccountsDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Colors.redAccent),
      margin: EdgeInsets.all(0),
      accountName: Text('accountName'),
      accountEmail: Text("accountEmail"),
      currentAccountPicture: Image.asset(
        'assets/images/cover_img.jpg',
        fit: BoxFit.cover,
      ),
      otherAccountsPictures: <Widget>[
        Image.asset(
          'assets/images/cover_img.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/cover_img.jpg',
          fit: BoxFit.cover,
        ),
      ],
      onDetailsPressed: () {
        print('onDetailsPressed');
      },
    );
  }
}
