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
  int counter=0;
  List<Widget>list=new List<Widget>();
  void oncliked(){
    Widget child=newitem(counter);
    setState(() {
      list.add(child);
    });
  }
  @override
  initState(){
    for(int i=0;i<5;i++){
      Widget child=newitem(i);
      list.add(child);
    }
  }
  Widget newitem(int i){
    Key key=new Key('item ${i}');
    Container child=new Container(
      key: key,
      padding: EdgeInsets.all(10.0),
      child: Chip(
        label: Text('${i} Name here'),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: ()=>removeitem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text(i.toString()),
        ),

      ),
    );
    counter++;
    return child;
  }
  void removeitem(Key key){
    for(int i=0;i<list.length;i++){
      Widget child=list.elementAt(i);
      if(child.key==key){
        setState(() {
          list.removeAt(i);
          print('Removing ${key.toString()}');
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello"),
      ),
     floatingActionButton: FloatingActionButton(
       onPressed: oncliked,child: Icon(Icons.add,),
            ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: list,
          ),
        ),
      ),
    );
  }
}
