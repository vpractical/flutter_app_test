import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Offstage控制子组件显示隐藏'),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _show;

  @override
  void initState() {
    _show = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Offstage(
          offstage: !_show,
          child: Text('Offstage控制子组件显示隐藏，类似gone'),
        ),
        RaisedButton(
          onPressed: () {
            print('click');
            _show = !_show;
            setState(() {});
          },
          child: Text('${_show ? '点击隐藏' : '点击显示'}'),
        ),
      ],
    );
  }
}
