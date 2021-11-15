import 'package:flutter/material.dart';
void main(){
  runApp(new MaterialApp(
    home: new myApp(),
  ));
}
class myApp extends StatefulWidget{
  @override
  _State createState()=>new _State();
}
class _State extends State<myApp>{
  List<Step>steps;
  int current;
  @override
  void initState() {
    // TODO: implement initState
    current=0;
    steps=<Step>[
      Step(title: Text('Step 1'), content: Text('Do something'),isActive: true),
      Step(title: Text('Step 2'), content: Text('Do something'),isActive: false),
      Step(title: Text('Step 3'), content: Text('Do something'),isActive: false)
    ];
  }
  void stepContinue(){
    setState(() {
      current++;
      if(current>=steps.length){
        current=steps.length-1;
      }
    });
  }
  void stepCancel(){
    setState(() {
      current--;
      if(current<0){
        current=0;
      }
    });
  }
  void stepTap(int index){
    setState(() {
      current=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Name here"),
      ),
      body: new Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Stepper(
            steps: steps,
            type: StepperType.vertical,
            currentStep: current,
            onStepCancel: stepCancel,
            onStepContinue: stepContinue,
            onStepTapped: stepTap,
          ),
        ),
      ),
    );
  }
}
