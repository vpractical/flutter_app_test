import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Tooltip'),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('卡机看到过还'),
        Tooltip(
          message: 'message',
          child: RaisedButton(
            onPressed: () {
              print('RaisedButton:onPress');
            },
          ),
          height: 32,
          padding: EdgeInsets.symmetric(horizontal: 16),
          verticalOffset: 24,
          //是否向下方偏移显示
          preferBelow: false,
          //是否应从语义树中排除工具提示的message???
          excludeFromSemantics: false,
        )
      ],
    );
  }
}
