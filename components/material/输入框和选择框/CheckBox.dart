import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          MCheckBox(),
          MCheckBox(),
          MCheckBoxListTile(),
          MCheckBoxListTile(),
        ],
      ),
    ),
  ));
}

class MCheckBox extends StatefulWidget {
  @override
  _MCheckBoxState createState() => _MCheckBoxState();
}

class _MCheckBoxState extends State<MCheckBox> {
  bool _isSelect = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _isSelect,
      onChanged: (isSelect) {
        _isSelect = isSelect;
        setState(() {});
      },
      //如果为 true，那么复选框的值可以是 true，false 或 null
      tristate: false,
      //水波纹颜色、选中后的填充色，会覆盖checkColor设置的颜色
      activeColor: Colors.red,
      checkColor: Colors.greenAccent,
      //点击区域
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

class MCheckBoxListTile extends StatefulWidget {
  @override
  _MCheckBoxListTileState createState() => _MCheckBoxListTileState();
}

class _MCheckBoxListTileState extends State<MCheckBoxListTile> {
  bool _isSelect = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _isSelect,
      onChanged: (isSelect) {
        _isSelect = isSelect;
        setState(() {});
      },
      activeColor: Colors.deepPurpleAccent,
      title: Text('Title'),
      subtitle: Text('SubTitle'),
      isThreeLine: false,
      //列表图块是否密集显示
      dense: false,
      //title和subTitle是否高亮，高亮时颜色跟随activeColor,默认false
      selected: true,
      //类似leading.左侧的一个icon，但是多行时不上下居中,默认icon时受activeColor影响
      secondary: Icon(Icons.ac_unit),
      //将选择框放在何处,leading 显示在左侧,platform,trailing 按钮显示在文字后面
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
