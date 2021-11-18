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
enum Animals{Cat,Dog,Bird,Fish,Lizard}
class _State extends State<myApp>{
  Animals selected=Animals.Cat;
  String value='Make a selection';
  List<PopupMenuEntry<Animals>>itemss=new List<PopupMenuEntry<Animals>>();
  @override
  void initState() {
    // TODO: implement initState
    for(Animals animal in Animals.values){
      itemss.add(PopupMenuItem(child: Text(getDisplay(animal),),value: animal,));
    }
  }
  void onSelected(Animals animal){
    setState(() {
      selected=animal;
      value='You selected ${getDisplay(animal)}';
    });
  }
  String getDisplay(Animals animals){
    int index=animals.toString().indexOf('.');
    index++;
    return animals.toString().substring(index);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: Center(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                child: Text(value),

              ),
              PopupMenuButton<Animals>(child:
                Icon(Icons.input),
              initialValue: Animals.Cat,
                onSelected: onSelected,
                itemBuilder: (BuildContext context){
                return itemss;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
