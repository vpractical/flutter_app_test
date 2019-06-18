import 'package:flutter/material.dart';

/// Makes its child draggable starting from long press
/// Draggable 是Flutter中一个可以拖拽到DragTarget的widget，同时他可以把自己带有的数据传递给DragTarget
/// LongPressDraggable
void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Draggable'),
          ),
          body: Body(),
        ),
      ),
    );

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> arr = [1, 2, 3, 4].map((i) => DragItem('it : $i')).toList();
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: arr,
      ),
    );
  }
}

class DragItem extends StatefulWidget {
  final String title;
  DragItem(this.title);

  @override
  _DragItemState createState() => _DragItemState();
}

class _DragItemState extends State<DragItem> {
  String _title;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: DragTarget<String>(
        builder: (context, data, data2) {
          return Container(
            height: 100,
            width: 100,
            color: Colors.redAccent,
            child: Center(child: Text(_title ?? widget.title)),
          );
        },
        //松手时 如果onWillAccept返回true 那么久会调用
        onAccept: (String index) {
          print('DragTarget:onAccept:$index');
          _title = index;
          setState(() {});
        },
        //手指拖着一个widget从另一个widget头上滑走时会调用
        onLeave: (String index) {
          print('DragTarget:onLeave:$index');
        },
        //接下来松手 是否需要将数据给这个widget
        onWillAccept: (String index) {
          print('DragTarget:onWillAccept:$index');
          return index != null;
        },
      ),
      //用户拖动item时，那个给用户看起来被拖动的widget
      feedback: Container(height: 100, width: 100, color: Colors.green, child: Text('feedback')),
      //这个是当item被拖动时，item原来位置用来占位的widget
      childWhenDragging: Container(
          height: 100, width: 100, color: Colors.deepPurpleAccent, child: Text('childWhenDragging')),
      data: widget.title,
      //设置后将与其他小部件竞争水平（或垂直）手势
      affinity: Axis.vertical,
      //限制横向、竖向拖动,不设置则随意拖动
//      axis: Axis.horizontal,
      //好像是达成onAccept的位置相对target的偏移量
      feedbackOffset: Offset.zero,
      //拖动过程中锚定的位置,Anchor ：锚,pointer时feedback图左上角移动到手指下，有点突兀
      dragAnchor: DragAnchor.child,
      //最大可拖动数量??? 0不能拖动，>0没看出区别
      maxSimultaneousDrags: 3,
      onDragStarted: () {
        print('onDragStarted');
      },
      onDragEnd: (DraggableDetails details) {
        print('onDragEnd:$details');
      },
      onDragCompleted: () {
        print('onDragCompleted');
      },
      onDraggableCanceled: (Velocity velocity, Offset offset) {
        print('onDraggableCanceled:$velocity-$offset');
      },
      ignoringFeedbackSemantics: true,
    );
  }
}
