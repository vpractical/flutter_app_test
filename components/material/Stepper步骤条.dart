import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Stepper步骤条'),
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
  int _currentStep = 0;
  List<Step> _steps;

  void initState() {
    super.initState();
    var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    _steps = arr.map((val) {
      return Step(
        title: Text('title:$val'),
        content: Text('content:$val'),
        subtitle: Text('subTitle:$val'),
        isActive: false,
        state: StepState.indexed,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    //非滚动组件，超出一屏时报overflow，嵌套个SingleChildScrollView
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Stepper(
            steps: _steps,
            //不给设置就不能滚动
            physics: ClampingScrollPhysics(),
            //条的方向，横向时需要注意宽高什么
            type: StepperType.vertical,
            currentStep: _currentStep,
            //状态改变时触发
            onStepTapped: (index) {
              print('onStepTapped:$index');
              _currentStep = index;
              setState(() {});
            },
            onStepContinue: () {
              print('onStepContinue:$_currentStep');
              if (_currentStep < _steps.length) {
                ++_currentStep;
              } else {
                _currentStep = 0;
              }
              setState(() {});
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                --_currentStep;
              }
              setState(() {});
              print('onStepCancel');
            },
//        controlsBuilder:,
          ),
        ],
      ),
    );
  }
}
