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
  List<Widget>lists=new List<Widget>();
  @override
  void initState() {
    // TODO: implement initState
    for(int i=0;i<5;i++){
      Widget child=newItem(i);
      lists.add(child);
    }
  }
  void onclicked(){
    Widget child=newItem(counter);
    setState(() {
      lists.add(child);
    });
  }

  Widget newItem(int i){
    Key key=new Key('item ${i}');
    Container child=new Container(
      key: key,
      padding: EdgeInsets.all(10.0),
      child: Chip(
        label: Text('${i} Name here'),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: ()=>removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text(
            i.toString()
          ),
        ),
      ),
    );counter++;
    return child;
  }
  void removeItem(Key key){
    for(int i=0;i<lists.length;i++){
      Widget child=lists.elementAt(i);
      if(child.key==key){
        setState(() {
          lists.removeAt(i);
          print('Removing ${key..toString()}');
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello"),

      ),floatingActionButton: FloatingActionButton(
      onPressed: onclicked,
      child:Icon(Icons.add),
    ),
      body: new Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: lists,
          ),
        ),
      ),
    );
  }
}
