import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanel'),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> mData = [];
  String currentExpand;

  @override
  void initState() {
    super.initState();
    while (mData.length < 8) {
      mData.add('val=${mData.length}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //滚动到头时，界面效果，BouncingScrollPhysics这是ios样式
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          ExpansionPanelList(
            children: mData.map((val) {
              return ExpansionPanel(
                headerBuilder: (context, bool) {
                  return Center(
                    child: Text(
                      'header:$val',
                      style: TextStyle(color: Colors.deepPurpleAccent, backgroundColor: Colors.lightGreen),
                    ),
                  );
                },
                body: ListBody(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('body$val'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('body$val'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('body$val'),
                    ),
                  ],
                ),
                isExpanded: currentExpand == val,
              );
            }).toList(),
            expansionCallback: (panelIndex, isExpanded) {
              print('expansionCallback:panelIndex=$panelIndex;isExpanded=$isExpanded');
              currentExpand = isExpanded ? null : mData[panelIndex];
              setState(() {});
            },
            animationDuration: Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
