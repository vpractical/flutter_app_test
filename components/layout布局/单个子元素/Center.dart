import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Center'),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      //子组件确定则随子组件大小，否则充满父组件
      child: Container(
        color: Colors.cyan,
        //宽度因子为2，即Center宽度为子组件宽度*2，未设置时Center充满父组件
        child: Center(
          heightFactor: 2,
          child: Container(
            width: 50,
            height: 50,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
