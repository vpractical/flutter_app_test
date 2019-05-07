import 'package:flutter/material.dart';

///在Flutter中，对话框会有两种风格，调用showDialog()方法展示的是material风格的对话框，
///调用showCupertinoDialog()方法展示的是ios风格的对话框。
///而这两个方法其实都会去调用showGeneralDialog()方法，
///可以从源码中看到最后是利用Navigator.of(context, rootNavigator: true).push()一个页面
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('AlertDialog'),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //上次点击时间
    DateTime _lastPressedAt;
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('AlertDialog'),
          onPressed: () {
            showDialog(
                context: context,
                //是否区域外点击取消dialog
                barrierDismissible: false,
                builder: (context) {
                  //WillPopScope物理返回键监听，屏蔽dialog时的返回按键
                  return WillPopScope(
                      child: AlertDialog(
                        title: Text('title'),
//                      titlePadding: ,
//                      contentPadding: ,
//                      titleTextStyle: ,
//                      contentTextStyle: ,
//                      backgroundColor: ,
//                      elevation: ,
//                      semanticLabel: ,
//                      shape: ,
                        actions: <Widget>[
                          Text('11111'),
                          Text('222'),
                          RaisedButton(
                            onPressed: null,
                            child: Text('33333'),
                          ),
                          RaisedButton(
                            onPressed: () => Navigator.of(context).pop(123),
                            child: Text('4444'),
                          ),
                        ],
                        content: Text('WillPopScope物理返回键监听，屏蔽dialog时的返回按键onWillPop: () async {}'),
                      ),
                      onWillPop: () async {
                        if (_lastPressedAt == null ||
                            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
                          //两次点击间隔超过1秒则重新计时
                          _lastPressedAt = DateTime.now();
                          return false;
                        }
                        return true;
                      });
                }).then((val) => print(val));
          },
        ),
      ],
    );
  }
}
