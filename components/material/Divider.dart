import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Divider'),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Divider(
          height: 16,
          //左侧的空白空间量
          indent: 20,
          color: Colors.blue,
        ),
      ],
    );
  }
}
