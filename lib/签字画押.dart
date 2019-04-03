import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: App(),
    ));

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('签字画押'),
        centerTitle: true,
      ),
      body: Signature(),
    );
  }
}

class Signature extends StatefulWidget {
  @override
  _SignatureState createState() => _SignatureState();
}

class _SignatureState extends State<Signature> {
  List<List<Offset>> _lines = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        _lines = [];
        setState(() {});
      },
      onPanDown: (DragDownDetails details) {
        RenderBox referenceBox = context.findRenderObject();
        Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
        _lines.add([]..add(localPosition));
      },
      onPanUpdate: (DragUpdateDetails details) {
        RenderBox referenceBox = context.findRenderObject();
        Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
        _lines.last.add(localPosition);
        setState(() {});
      },
      onPanCancel: () {
        setState(() {});
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: CustomPaint(
          painter: SignaturePainter(_lines),
        ),
      ),
    );
  }
}

class SignaturePainter extends CustomPainter {
  final List<List<Offset>> lines;
  final width = 30;
  final height = 30;

  SignaturePainter(this.lines);

  _drawLine(Canvas canvas, List<Offset> line) {
    //画线
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    Path path = Path()..moveTo(line[0].dx, line[0].dy);
    for (int i = 1; i <= line.length - 1; i++) {
      if (i == line.length - 1) {
        path.lineTo(line[i].dx, line[i].dy);
      } else {
        path.quadraticBezierTo(line[i].dx, line[i].dy, line[i + 1].dx, line[i + 1].dy);
      }
    }
    canvas.drawPath(path, paint);
  }

  _drawHeart(Canvas canvas, Offset offset) {
    //画心
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red;
    Point zero = Point(offset.dx, offset.dy);
    num angle = 0;
    Point point = _getHeartPath(angle);
    Path path = Path()..moveTo(zero.x + point.x, zero.y + point.y);
    while (angle < 20) {
      point = _getHeartPath(angle);
      path.lineTo(zero.x + point.x, zero.y + point.y);
      angle += 1;
    }
    canvas.drawPath(path, paint);
  }

  Point _getHeartPath(num angle) {
    var t = (angle / pi);
    var x = 18 * pow(sin(t), 3);
    var y = 16 * cos(t) - 5 * cos(2 * t) - 2 * cos(3 * t) - cos(4 * t);
    y *= -1;
    return Point(x, y);
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i <= lines.length - 1; i++) {
      if (lines[i].length == 1) {
        _drawHeart(canvas, lines[i][0]);
      } else {
        _drawLine(canvas, lines[i]);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter other) {
//    return other.lines.length != lines.length || other.lines.last.length != lines.last.length;
    return true;
  }
}
