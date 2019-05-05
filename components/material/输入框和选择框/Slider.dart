import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
          ),
          MSlider(),
        ],
      ),
    ),
  ));
}

class MSlider extends StatefulWidget {
  @override
  _MSliderState createState() => _MSliderState();
}

class _MSliderState extends State<MSlider> {
  var _val = 5.0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _val,
      onChanged: (value) {
        print('onChanged:value:$value');
        _val = value;
        setState(() {});
      },
      min: 0,
      max: 100,
      //分为几块，e.g.10，slider只能滑到5个位置,定义后显示label属性
      divisions: 10,
      //显示在节点上的label
      label: '${_val.toInt()}',
      activeColor: Colors.redAccent,
      inactiveColor: Colors.green,
      //创建Widget时格式化数值的过程，和初始_val相关的值
      semanticFormatterCallback: (value) {
        print('semanticFormatterCallback:value:$value');
        return value.toInt().toString();
      },
      onChangeStart: (value) {
        print('onChangeStart:value:$value');
        setState(() {});
      },
      onChangeEnd: (value) {
        print('onChangeEnd:value:$value');
      },
    );
  }
}
