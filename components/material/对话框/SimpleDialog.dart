import 'package:flutter/material.dart';

///在Flutter中，对话框会有两种风格，调用showDialog()方法展示的是material风格的对话框，
///调用showCupertinoDialog()方法展示的是ios风格的对话框。
///而这两个方法其实都会去调用showGeneralDialog()方法，
///可以从源码中看到最后是利用Navigator.of(context, rootNavigator: true).push()一个页面
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('SimpleDialog'),
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
          child: Text('SimpleDialog双击返回'),
          onPressed: () {
            showDialog(
                context: context,
                //是否区域外点击取消dialog
                barrierDismissible: false,
                builder: (context) {
                  //WillPopScope物理返回键监听，屏蔽dialog时的返回按键
                  return WillPopScope(
                      child: SimpleDialog(
                        title: Text('title'),
                        titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
                        contentPadding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0),
                        elevation: 0,
                        backgroundColor: Colors.white70,
                        //语义标签
                        semanticLabel: 'semanticLabel',
                        shape: RoundedRectangleBorder(
                            side: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
                        children: <Widget>[
                          SimpleDialogOption(
                            child: Text('卡十几个我哦啊你哦啊表不能白u哦啊哈哈哦极爱!'),
                          ),
                          SimpleDialogOption(
                            child: Text('卡十几个我哦啊你哦啊表不能白u哦啊哈哈哦极爱!'),
                          ),
                          SimpleDialogOption(
                            child: RaisedButton(
                              onPressed: () {
                                print('RaisedButton:click');
                              },
                              child: Text('cancel'),
                            ),
                            onPressed: () {
                              print('SimpleDialogOption:click');
                            },
                          ),
                          SimpleDialogOption(
                            child: RaisedButton(
                              child: Text('ok'),
                              onPressed: null,
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          SimpleDialogOption(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(123);
                                  },
                                  child: Text('ok'),
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(456);
                                  },
                                  child: Text('cancel'),
                                ),
                              ],
                            ),
                          ),
                        ],
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
        RaisedButton(
          child: Text('loading'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }).then((val) {
              print(val);
            });
          },
        ),
        RaisedButton(
          child: Text('SimpleDialog.Builder未实现'),
          onPressed: () {
//            showGeneralDialog(context: context, pageBuilder: null)
          },
        ),
      ],
    );
  }
}
