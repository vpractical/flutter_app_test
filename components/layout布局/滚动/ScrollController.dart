import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title: RaisedButton(
        child: Text('ScrollController'),
        onPressed: () {
//          _controller.jumpTo(1000);
          _controller.animateTo(1000, duration: Duration(seconds: 2), curve: Curves.slowMiddle);
          ScrollPosition position = _controller.position;
          print(position.extentInside);
          print(position.extentAfter);
          print(position.extentBefore);
//          I/flutter (19459): 603.4285714285714
//          I/flutter (19459): 0.0
//          I/flutter (19459): 646.5714285714286
        },
      )),
      body: Body(),
    ),
  ));
}

ScrollController _controller = ScrollController(
  //滚动偏移量，即向上滚动了多少距离
  initialScrollOffset: 0,
  //每次滚动完成时，PageStorage是否保存滚动偏移量，以便在重新build时保持偏移,没看到false时效果???
  keepScrollOffset: true,
);

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      //滚动时监听
      if (_controller.position.maxScrollExtent == _controller.position.pixels) {
        print('到底了');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: ListView(
        controller: _controller,
        itemExtent: 50,
        dragStartBehavior: DragStartBehavior.start,
        children: List.generate(
          25,
          (i) => Container(
                child: Text('index: $i'),
                color: Colors.grey,
              ),
        ),
      ),
    );
  }
}
