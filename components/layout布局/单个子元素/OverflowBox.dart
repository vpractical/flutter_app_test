import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('OverflowBox施加不同约束,允许子项溢出父级'),
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
        Container(
          height: 200,
          color: Colors.blue,
          child: OverflowBox(
            alignment: Alignment.center,
            minWidth: 50,
            maxWidth: 100,
            minHeight: 50,
            maxHeight: 100,
            child: Container(
              color: Colors.deepPurple,
              child: Text('OverflowBox'),
            ),
          ),
        ),
        Container(
          height: 5,
        ),
        Container(
          color: Colors.green,
          child: SizedOverflowBox(
            size: Size(100, 100),
            alignment: Alignment.center,
            child: Container(
              color: Colors.deepPurple,
            ),
          ),
        ),
      ],
    );
  }
}
