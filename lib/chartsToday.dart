import 'dart:math';
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
  String year;
  int sales;
  Sales(this.year,this.sales);
}
class _State extends State<myApp>{
  List<Sales>_data;
  List<charts.Series<Sales,String>>_chartData;
  void makeData(){
    _data=new List<Sales>();
    _chartData=new List<charts.Series<Sales,String>>();
    final rnd=new Random();
    for(int i=2015;i<2021;i++){
      _data.add(new Sales(i.toString(), rnd.nextInt(1000)));
    }
    _chartData.add(new charts.Series(id: 'Sales',
        data: _data,
        colorFn: (Sales sales,__)=>charts.MaterialPalette.green.shadeDefault,
        fillPatternFn: (Sales sales,__)=>charts.FillPatternType.forwardHatch,
        displayName: 'sales',
        domainFn: (Sales sales,__)=>sales.year,
        measureFn: (Sales sales,__)=>sales.sales),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
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
            new Expanded(child: new charts.BarChart(_chartData)),
          ],
        ),
      ),
    );
  }
}
