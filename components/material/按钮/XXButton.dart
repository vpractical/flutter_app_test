import 'package:flutter/material.dart';

///RaisedButton凸起的按钮，其实就是Android中的Material Design风格的Button ，继承自MaterialButton
///FlatButton扁平化的按钮，继承自MaterialButton
///OutlineButton带边框且背景透明的按钮
///IconButton图标按钮,继承自StatelessWidget
///ButtonBar
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('各种按钮'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('获取'),
            onPressed: () => print('click'),
            onHighlightChanged: (bool) {
              print("水波纹高亮回调，是否按下:$bool");
            },
            //水波纹高亮变化回调,按下返回true,抬起返回false
            textTheme: ButtonTextTheme.primary,
            textColor: Colors.black,
//          disabledTextColor: Colors.white, //禁用时候文字的颜色
//          color: Colors.green, //按钮的背景颜色
//          disabledColor: Colors.grey, //禁用的时候显示的颜色
//          highlightColor: Colors.grey, //点击或者toch控件高亮的时候显示在控件上面，水波纹下面的颜色
            splashColor: Colors.cyan,
            //水波纹的颜色
            colorBrightness: Brightness.light,
            //按钮主题,影响背景色文字颜色等
            elevation: 8,
            highlightElevation: 10,
            //高亮时候的阴影
            disabledElevation: 0,
            //禁用时的阴影
            padding: EdgeInsets.all(20),
            shape: CircleBorder(side: BorderSide.none),
            //按钮形状
            clipBehavior: Clip.none,
            //裁切模式
            materialTapTargetSize: MaterialTapTargetSize.padded,
            //缩放方式???
            animationDuration: Duration(milliseconds: 300),
          ),
          FlatButton(
            onPressed: () {},
            child: Text('FlatButton'),
            onHighlightChanged: (bool isLight) {
              print("高亮按钮是否按下：$isLight");
            },
            textTheme: ButtonTextTheme.normal,
//          disabledTextColor: Colors.white, //禁用时候文字的颜色
            color: Colors.grey,
            //按钮的背景颜色
//          disabledColor: Colors.grey, //禁用的时候显示的颜色
//          highlightColor: Colors.grey, //点击或者toch控件高亮的时候显示在控件上面，水波纹下面的颜色
            splashColor: Colors.cyan,
            //水波纹的颜色
            colorBrightness: Brightness.light,
            //按钮主题,影响背景色文字颜色等
            padding: EdgeInsets.all(20),
            shape: CircleBorder(side: BorderSide.none),
            //按钮形状
            clipBehavior: Clip.none,
            //裁切模式
            materialTapTargetSize: MaterialTapTargetSize.padded, //缩放方式???
          ),
          FlatButton.icon(
            onPressed: () {},
            icon: Icon(Icons.ac_unit),
            label: Text('FlatButton'),
          ),
          OutlineButton(
            onPressed: () {},
            child: Text('OutlineButton'),
          ),
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () {},
            iconSize: 30,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              OutlineButton(
                onPressed: () {},
                child: Text('Outlinon'),
              ),
              OutlineButton(
                onPressed: () {},
                child: Text('OutlineButton'),
              ),
              OutlineButton(
                onPressed: () {},
                child: Text('Outl'),
              ),
            ],
          ),
        ],
      ),
    ),
  ));
}
