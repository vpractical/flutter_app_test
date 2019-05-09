import 'package:flutter/material.dart';

///文字的话，Baseline高度=baseline值+Text的baseline值
///也就是说定义fontSize=40，实际高度是40+Text的baseline值
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Baseline'),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey,
          height: 150,
          child: Row(
            children: <Widget>[
              Container(width: 50.0, height: 50.0, color: Colors.green),
              Baseline(
                //从顶部算
                baseline: 0,
                //对字符有效
                baselineType: TextBaseline.alphabetic,
                child: Container(width: 50.0, height: 50.0, color: Colors.red),
              ),
              Baseline(
                baseline: 50,
                baselineType: TextBaseline.alphabetic,
                child: Container(width: 50.0, height: 50.0, color: Colors.red),
              ),
              Baseline(
                baseline: 150,
                baselineType: TextBaseline.alphabetic,
                child: Container(width: 50.0, height: 50.0, color: Colors.red),
              ),
              Text('上下居中了\nbaseline != 期望值', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        Container(
          color: Colors.green,
          child: Row(
            children: <Widget>[
              Baseline(
                baseline: 0,
                //alphabetic：对齐字符底部的水平线；
                //ideographic：对齐表意字符的水平线
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  'TjTjTj',
                  style: TextStyle(
                    fontSize: 40,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ),
              Baseline(
                baseline: 0,
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  'RyRyRy',
                  style: TextStyle(
                    fontSize: 40,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.deepPurpleAccent,
          child: Row(
            children: <Widget>[
              Baseline(
                baseline: 0,
                //alphabetic：对齐字符底部的水平线；
                //ideographic：对齐表意字符的水平线
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  'TjTjTj',
                  style: TextStyle(
                    fontSize: 40,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ),
              Baseline(
                baseline: 40,
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  'RyRyRy',
                  style: TextStyle(
                    fontSize: 40,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.blueGrey,
          child: Row(
            children: <Widget>[
              Baseline(
                baseline: 40,
                baselineType: TextBaseline.ideographic,
                child: Text(
                  'RyRyRy',
                  style: TextStyle(
                    fontSize: 40,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ),
              Text(
                'textBaseline,Text无效果',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          color: Colors.grey,
          child: Row(
            children: <Widget>[
              Baseline(
                //从顶部算
                baseline: 50,
                //对字符有效
                baselineType: TextBaseline.alphabetic,
                child: Container(width: 50.0, height: 50.0, color: Colors.red),
              ),
              Container(width: 10, height: 2, color: Colors.cyanAccent),
              Text('国图', style: TextStyle(fontSize: 40, textBaseline: TextBaseline.alphabetic)),
              Container(width: 10, height: 2, color: Colors.cyanAccent),
              Text('国图', style: TextStyle(fontSize: 40, textBaseline: TextBaseline.ideographic)),
              Container(width: 10, height: 2, color: Colors.cyanAccent),
              Baseline(
                baseline: 50,
                baselineType: TextBaseline.ideographic,
                child: Text(
                  'BC',
                  style: TextStyle(
                    fontSize: 40,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
