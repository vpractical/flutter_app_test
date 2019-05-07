import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('SnackBar'),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            SnackBar snackBar = SnackBar(
              content: Text('content'),
              action: SnackBarAction(
                label: 'label',
                onPressed: () {
                  print('SnackBarAction:onPressed');
                },
                textColor: Colors.redAccent,
                disabledTextColor: Colors.cyan,
              ),
              backgroundColor: Colors.brown,
              duration: Duration(seconds: 2),
//              animation: ,
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: Text('SnackBar'),
        )
      ],
    );
  }
}
