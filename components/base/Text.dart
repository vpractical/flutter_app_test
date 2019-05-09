import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Text'),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Paint _paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          color: Colors.grey,
          child: Text(
            'Text',
            style: TextStyle(
              //是否继承父属性,默认为true，设置为false时候表示不显示
              inherit: true,
              color: Colors.red,
//              backgroundColor: Colors.grey,
              fontSize: 24,
              //字体粗细FontWeight.bold
              fontWeight: FontWeight.normal,
              //FontStyle.italic斜体
              fontStyle: FontStyle.normal,
              //自定义字体的时候用
//              fontFamily: '',
//              fontFamilyFallback: ,
              //字符间间隔
              letterSpacing: 5,
              //字或单词间距,没看出效果
              wordSpacing: 10,
              //参见layout布局/Baseline
              textBaseline: TextBaseline.alphabetic,
              //会乘以fontSize作为行高
              height: 2,
//              locale:Locale(_languageCode,_countryCode = ?),
              //可以绘制背景等，和backgroundColor冲突
              background: _paint,
//              foreground: Paint(),
//              shadows: ,
              //添加上划线，下划线，删除线
              decoration: TextDecoration.none,
              //划线的颜色
              decorationColor: Colors.blueAccent,
              //画实线，虚线，两条线，点, 波浪线等
              decorationStyle: TextDecorationStyle.dashed,
              debugLabel: 'debugLabel',
              //自定义字体的时候用
//              package: ,
            ),
          ),
        ),
        //段落式的文本
        Container(
          color: Colors.lightBlueAccent,
          child: Text.rich(TextSpan(text: '段落式文本Text.rich = RichText')),
        ),
        Container(
          color: Colors.amber,
          child: RichText(
            text: TextSpan(
              text: 'RichText',
              //子TextSpan会继承这个style
              style: TextStyle(fontSize: 24, color: Colors.black),
              children: [
                TextSpan(text: ' TextSpan1 ', style: TextStyle(fontSize: 18, color: Colors.lightGreen)),
                TextSpan(text: ' TextSpan2 '),
                TextSpan(text: ' TextSpan3 ', style: TextStyle(color: Colors.deepPurpleAccent)),
              ],
              //给富文本某一段添加点击事件
              recognizer: TapGestureRecognizer(),
            ),
            textAlign: TextAlign.end,
//          locale: ,
            textDirection: TextDirection.ltr,
            //默认true如果为false，文本中的标志符号将被定位为没有限制的水平空间
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            //字体缩放
            textScaleFactor: 1.2,
            maxLines: 1,
            strutStyle: StrutStyle(
              //String fontFamily,
              //List<String> fontFamilyFallback,
              //this.fontSize,
              //this.height,
              //this.leading,
              //this.fontWeight,
              //this.fontStyle,
              //this.forceStrutHeight,
              //this.debugLabel,
              //String package,
              //可以达到和TextStyle.height同样效果
              leading: 1,
              //可以达到和TextStyle.height同样效果
              fontSize: 40,
            ),
          ),
        ),
        //代码未指定样式, 此时将使用最近的 DefaultTextStyle 样式
        // 若给定样式中TextStyle.inherit 属性为true , 给定样式则将与最近的 DefaultTextStyle 样式合并
        DefaultTextStyle(
          style: TextStyle(fontSize: 20, color: Colors.deepPurpleAccent),
          child: Text('DefaultTextStyle:代码未指定样式, 此时将使用最近的 DefaultTextStyle样式'),
//          textAlign: ,
//          softWrap: ,
//          overflow: ,
//          maxLines: ,
        ),
      ],
    );
  }
}
