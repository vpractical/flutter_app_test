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
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.cyan,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  side: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(20))),
              //???
              borderOnForeground: true,
              margin: EdgeInsets.all(10),
              //???
              clipBehavior: Clip.none,
              //是否是单个语义容器
              semanticContainer: true,
              child: Container(
                //这个color会覆盖shape
//                color: Colors.deepPurpleAccent,
                child: SizedBox(
                  height: 200,
                  child: Center(
                    child: Text('card1'),
                  ),
                ),
              ),
            ),
            Card(),
          ],
        ));
  }
}
