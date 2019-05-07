import 'package:flutter/material.dart';

///在Flutter中，对话框会有两种风格，调用showDialog()方法展示的是material风格的对话框，
///调用showCupertinoDialog()方法展示的是ios风格的对话框。
///而这两个方法其实都会去调用showGeneralDialog()方法，
///可以从源码中看到最后是利用Navigator.of(context, rootNavigator: true).push()一个页面
///
/// BottomSheet
/// showBottomSheet:返回键返回
/// showModalBottomSheet:点击空白返回，常用!
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('BottomSheet'),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin<Body> {
  @override
  Widget build(BuildContext context) {
    AnimationController _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('showBottomSheet'),
          onPressed: () {
            showBottomSheet(
                context: context,
                builder: (context) {
                  return BottomSheet(
                    onClosing: () {
                      print('onClosing');
                    },
                    builder: (context) {
                      return Container(
                        decoration: BoxDecoration(color: Colors.grey),
                        height: 200,
                        child: Center(
                          child: Text('builder-return'),
                        ),
                      );
                    },
                    elevation: 0,
                    enableDrag: true,
                    animationController: _controller,
                  );
                });
          },
        ),
        RaisedButton(
          child: Text('showModalBottomSheet'),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(color: Colors.grey),
                  height: 200,
                  child: Center(
                    child: Text('builder-return'),
                  ),
                );
              },
            ).then((val) {
              print(val);
            });
          },
        ),
      ],
    );
  }
}
