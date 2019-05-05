import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Radio'),
        ),
        body: Body(),
      ),
    ));

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> arr = ['语文', '数学', '地理', '毛概'];
  String _val;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Radio<String>(
          //Radio是单选框，和checkbox一样本身不包含状态，当groupValue = value时代表选中状态
          value: arr[0],
          groupValue: _val,
          onChanged: (val) {
            _val = val;
            setState(() {});
          },
          activeColor: Colors.redAccent,
          //点击区域
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Radio<String>(
          //Radio是单选框，和checkbox一样本身不包含状态，当groupValue = value时代表选中状态
          value: arr[1],
          groupValue: _val,
          onChanged: (val) {
            _val = val;
            setState(() {});
          },
          activeColor: Colors.deepPurpleAccent,
          //点击区域
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        RadioListTile(
          value: arr[2],
          groupValue: _val,
          onChanged: (val) {
            _val = val;
            setState(() {});
          },
          activeColor: Colors.green,
          title: Text(arr[2]),
//          subtitle: Text('SubTitle'),
          isThreeLine: false,
          //列表图块是否密集显示
          dense: false,
          //title和subTitle是否高亮，高亮时颜色跟随activeColor,默认false
          selected: true,
          //类似leading.左侧的一个icon，但是多行时不上下居中,默认icon时受activeColor影响
          secondary: Icon(Icons.ac_unit),
          //将选择框放在何处,leading 显示在左侧,platform,trailing 按钮显示在文字后面
          controlAffinity: ListTileControlAffinity.leading,
        ),
        RadioListTile(
          value: arr[3],
          groupValue: _val,
          onChanged: (val) {
            _val = val;
            setState(() {});
          },
          activeColor: Colors.blueAccent,
          title: Text(arr[3]),
          subtitle: Text(arr[3]),
          isThreeLine: false,
          //列表图块是否密集显示
          dense: false,
          //title和subTitle是否高亮，高亮时颜色跟随activeColor,默认false
          selected: true,
          //类似leading.左侧的一个icon，但是多行时不上下居中,默认icon时受activeColor影响
          secondary: Icon(Icons.ac_unit),
          //将选择框放在何处,leading 显示在左侧,platform,trailing 按钮显示在文字后面
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ],
    );
  }
}
