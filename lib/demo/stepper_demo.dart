import 'package:flutter/material.dart';
import 'package:number1/model/post.dart';

///步骤widget
class StepperDemo extends StatefulWidget {
  const StepperDemo({Key? key}) : super(key: key);

  @override
  State<StepperDemo> createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  var _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StepperDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
                data: ThemeData(primarySwatch: Colors.grey),
                child: Stepper(
                    currentStep: _currentStep,
                    onStepTapped: (value) {
                      setState(() {
                        _currentStep = value;
                      });
                    },
                    onStepContinue: () {
                      setState(() {
                        _currentStep < 2 ? _currentStep++ : _currentStep = 0;
                      });
                    },
                    onStepCancel: () {
                      setState(() {
                        _currentStep > 0 ? _currentStep-- : _currentStep = 0;
                      });
                    },
                    steps: [
                      Step(
                          title: Text(posts[0].title),
                          content: Text(posts[0].description),
                          subtitle: Text(posts[0].author),
                          isActive: _currentStep == 0),
                      Step(
                          title: Text(posts[1].title),
                          content: Text(posts[1].description),
                          subtitle: Text(posts[1].author),
                          isActive: _currentStep == 1),
                      Step(
                          title: Text(posts[2].title),
                          content: Text(posts[2].description),
                          subtitle: Text(posts[2].author),
                          isActive: _currentStep == 2)
                    ]))
          ],
        ),
      ),
    );
  }
}
