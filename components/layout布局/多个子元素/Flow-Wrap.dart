import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

///Flow可以很轻易的实现Wrap的效果，但是Wrap更多的是在使用了Flex中的一些概念，某种意义上说是跟Row、Column更加相似的。
///单行的Wrap跟Row表现几乎一致，单列的Wrap则跟Row表现几乎一致。但Row与Column都是单行单列的，Wrap则突破了这个限制，
/// mainAxis上空间不足时，则向crossAxis上去扩展显示。//从效率上讲，Flow肯定会比Wrap高，但是Wrap使用起来会方便一些。

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Flow-Wrap'),
      ),
      body: Body2(),
      drawer: Body(),
//      body: Body(),
    ),
  ));
}

class Body2 extends StatelessWidget {
  final List<Chip> _chips = [];

  Body2() {
    _generateTags();
  }

  _generateTags() {
    int a = 0;
    while (a < 50) {
      _chips.add(Chip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        label: Text('${WordPair.random().asPascalCase}$a'),
        shape:
            RoundedRectangleBorder(side: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(6))),
      ));
      a++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      height: double.infinity,
      width: double.infinity,
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        //主轴方向间距
        spacing: 5,
        //交叉轴方向上的对齐方式
        runAlignment: WrapAlignment.start,
        //交叉轴方向间距
        runSpacing: 5,
        //交叉轴方向上的对齐方式,貌似无效
        crossAxisAlignment: WrapCrossAlignment.start,
//      textDirection: ,
//      verticalDirection: ,
        children: _chips,
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Chip> _chips = [];

  @override
  void initState() {
    super.initState();
    int a = 0;
    var cs = [Colors.redAccent, Colors.green, Colors.blueAccent];
    while (a < 30) {
      _chips.add(Chip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        label: Text('${WordPair.random().asPascalCase}$a'),
        backgroundColor: cs[a % 3],
        shape:
            RoundedRectangleBorder(side: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(6))),
      ));
      a++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowDelegateImpl(),
      children: _chips,
    );
  }
}

class FlowDelegateImpl extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    //如果offsetX加上child宽度小于屏幕宽度则继续绘制否则换行
    double screenW = context.size.width;
    double padding = 5;
    double offsetX = padding;
    double offsetY = padding;
    for (int i = 0; i < context.childCount; i++) {
      if (offsetX + context.getChildSize(i).width > screenW) {
        offsetX = padding;
        offsetY += padding + context.getChildSize(i).height;
      }

      if (offsetX + context.getChildSize(i).width < screenW) {
        context.paintChild(i, transform: Matrix4.translationValues(offsetX, offsetY, 0));
        offsetX = offsetX + padding + context.getChildSize(i).width;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return true;
  }
}
