import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('GridView')),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //显示进度条，自定义???
    return Scrollbar(
      child: ListView(
        children: List.generate(200, (i) {
          return ListTile(
            title: Text('item: $i'),
          );
        }),
      ),
    );
  }
}
