import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Switch'),
        ),
        body: Column(
          children: <Widget>[
            MSwitch(),
            MSwitch(),
            MSwitchListTile(),
            MSwitchListTile2(),
          ],
        ),
      ),
    ));

class MSwitch extends StatefulWidget {
  @override
  _MSwitchState createState() => _MSwitchState();
}

class _MSwitchState extends State<MSwitch> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _checked,
      onChanged: (bool) {
        _checked = bool;
        setState(() {});
      },
      //打开时thumb颜色
      activeColor: Colors.blue,
      //打开时track颜色
      activeTrackColor: Colors.green,
      //关闭时track颜色
      inactiveTrackColor: Colors.redAccent,
      //关闭时thumb颜色
//      inactiveThumbColor: Colors.deepPurpleAccent,
      //打开时thumb上显示的图片,会覆盖activeColor
      activeThumbImage: NetworkImage('http://pic15.nipic.com/20110813/1993003_205156492136_2.jpg'),
      //关闭时thumb上显示的图片，会被inactiveThumbColor覆盖
      inactiveThumbImage: AssetImage('assets/images/shake.png'),
      //点击区域
      materialTapTargetSize: MaterialTapTargetSize.padded,
      //???
      dragStartBehavior: DragStartBehavior.start,
    );
  }
}

class MSwitchListTile extends StatefulWidget {
  @override
  _MSwitchListTileState createState() => _MSwitchListTileState();
}

class _MSwitchListTileState extends State<MSwitchListTile> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _checked,
      onChanged: (bool) {
        _checked = bool;
        setState(() {});
      },
      //打开时thumb颜色
      activeColor: Colors.blue,
      //打开时track颜色
      activeTrackColor: Colors.green,
      //关闭时track颜色
      inactiveTrackColor: Colors.redAccent,
      //关闭时thumb颜色
//      inactiveThumbColor: Colors.deepPurpleAccent,
      //打开时thumb上显示的图片,会覆盖activeColor
      activeThumbImage: NetworkImage('http://pic15.nipic.com/20110813/1993003_205156492136_2.jpg'),
      //关闭时thumb上显示的图片，会被inactiveThumbColor覆盖
      inactiveThumbImage: AssetImage('assets/images/shake.png'),
      title: Text('Title'),
      subtitle: Text('SubTitle'),
      isThreeLine: false,
      //列表图块是否密集显示
      dense: false,
      //title和subTitle是否高亮，高亮时颜色跟随activeColor,默认false
      selected: true,
      //类似leading.左侧的一个icon，但是多行时不上下居中,默认icon时受activeColor影响
      secondary: Icon(Icons.ac_unit),
    );
  }
}

class MSwitchListTile2 extends StatefulWidget {
  @override
  _MSwitchListTileState2 createState() => _MSwitchListTileState2();
}

class _MSwitchListTileState2 extends State<MSwitchListTile2> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: _checked,
      onChanged: (bool) {
        _checked = bool;
        setState(() {});
      },
    );
  }
}
