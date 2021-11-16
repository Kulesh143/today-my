import 'dart:math';

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
class Area{
  int index;
  String name;
  Color color;
  Area({this.index:-1,this.name:'Area',this.color:Colors.lightBlueAccent});
}
class _State extends State<myApp>{
  int location;
  List<Area>areas;
  @override
  void initState() {
    // TODO: implement initState
    areas=new List<Area>();
    for(int i=0;i<16;i++){
      areas.add(Area(index: 1,name: 'Area ${i}'));
    }
    var rng=new Random();
    location=rng.nextInt(areas.length);
  }
  Widget generate(int index){
    return GridTile(child: Container(
      padding: EdgeInsets.all(5.0),
      child: RaisedButton(
        onPressed: ()=>onpressed(index),
        color: areas[index].color,
        child: Text(
          areas[index].name,textAlign: TextAlign.center,
        ),
      ),
    ));
  }
  void onpressed(int index){
    setState(() {
      if(index==location){
        areas[index].color=Colors.green;
      }else{
        areas[index].color=Colors.red;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello"),
      ),
      body: new Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: GridView.count(crossAxisCount: 4,children: List<Widget>.generate(16,generate),),
        ),
      ),
    );
  }
}
