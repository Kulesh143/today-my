import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
void main(){
  runApp(new MaterialApp(
    home: new myApp(),
  ));
}
class myApp extends StatefulWidget{
  @override
  _State createState()=>new _State();
}
class Sales{
  int year;
  int sales;
  charts.Color color;
  Sales(this.year,this.sales,this.color);
}
class _State extends State<myApp>{
  List<Sales>_data;
  List<charts.Series<Sales,int>>_chartData;
  void makeData(){
    _chartData=new List<charts.Series<Sales,int>>();
    _data=<Sales>[
      new Sales(0,100,charts.MaterialPalette.red.shadeDefault),
  new Sales(1, 75, charts.MaterialPalette.blue.shadeDefault),
  new Sales(2, 25, charts.MaterialPalette.green.shadeDefault),
  new Sales(3, 5, charts.MaterialPalette.yellow.shadeDefault),
  ];
    _chartData.add(new charts.Series(id: 'Sales',
        data: _data,
        colorFn: (Sales sales,_)=>sales.color,
        domainFn: (Sales sales,_)=>sales.year,
        measureFn: (Sales sales,_)=>sales.sales));
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    makeData();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text("My App"),
            new Expanded(child: new charts.PieChart<dynamic>(_chartData,
              animate: true,
              animationDuration: new Duration(seconds: 5),)),
          ],
        ),
      ),
    );
  }
}
