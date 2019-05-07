import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Column(
        children: <Widget>[
          MDate(),
          MTime(),
//          MonthPicker(
//            selectedDate: DateTime.now(),
//            onChanged: (value) {
//              print(value.toString());
//            },
//            firstDate: DateTime(2020),
//            lastDate: DateTime(2020),
//          ),
//          YearPicker(
//            selectedDate: DateTime.now(),
//            onChanged: (value) {
//              print(value.toString());
//            },
//            firstDate: DateTime(2000),
//            lastDate: DateTime(2020),
//          ),
        ],
      ),
    ),
  ));
}

class MDate extends StatefulWidget {
  @override
  _MDateState createState() => _MDateState();
}

class _MDateState extends State<MDate> {
  var _date;

  _showDatePicker(context) async {
    Locale locale = Localizations.localeOf(context);
    var picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2020),
      locale: locale,
      //先选年还是先选月日
      initialDatePickerMode: DatePickerMode.day,
      //rtl：从右到左读,默认ltr
      textDirection: TextDirection.ltr,
//      builder: ,
//      selectableDayPredicate: ,
    );
    if (picker != null) {
      _date = picker.toString();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => _showDatePicker(context),
      child: Text(_date ?? '日期'),
    );
  }
}

class MTime extends StatefulWidget {
  @override
  _MTimeState createState() => _MTimeState();
}

class _MTimeState extends State<MTime> {
  var _time;

  _showTimePicker(context) async {
    var picker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picker != null) {
      _time = picker.toString();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => _showTimePicker(context),
      child: Text(_time ?? '时间'),
    );
  }
}
