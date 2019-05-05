import 'package:flutter/material.dart';

///FloatingActionButton有regular, mini, extended三种类型，
///默认为false即regular类型,
///true时按钮变小即mini类型，
///extended需要通过FloatingActionButton.extended()创建，可以定制显示内容
main() => runApp(
      MaterialApp(
          home: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Scaffold(
              appBar: AppBar(),
              floatingActionButton: FloatingActionButton(
                child: Text('返回\n顶部'),
                onPressed: () {
                  print('click1');
                },
                tooltip: 'tooltip', //长按时显示的提示
                foregroundColor: Colors.white, //前景色，影响到文字颜色
                backgroundColor: Colors.blue,
                elevation: 8,
//                heroTag:, //hero效果使用的tag,系统默认会给所有FAB使用同一个tag,方便做动画效果
                highlightElevation: 12,
                disabledElevation: 0,
                mini: false,
                shape: CircleBorder(side: BorderSide(color: Colors.red)),
                clipBehavior: Clip.none,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                isExtended: false, //是否扩展按钮，是否通过extended方式创建
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Scaffold(
              appBar: AppBar(),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () {},
                label: Text('返回\n顶部'),
                shape: CircleBorder(), //扩展创建的默认StadiumBorder两端是半圆的边框
                isExtended: true,
              ),
            ),
          )
        ],
      )),
    );
