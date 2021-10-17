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
  @override
  Widget build(BuildContext context) {
    String value='';
    double val=0.0;
    bool vals=false;
    TextEditingController user=new TextEditingController();
    void onchange(bool value){
      setState(() {
        vals=value;
      });
    }
    void _setval(double value){
      setState(() {
        val=value;
      });
    }
    Future _selectdate()async{
      DateTime picked=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2016), lastDate: DateTime(2099));
      if(picked!=null){
        setState(() {
          value=picked.toString();
        });
      }
    }
    void showbottom(){
      showModalBottomSheet(context: context, builder:
      (BuildContext context){
        return Container(
        padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("some info here",style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              ),
              RaisedButton(onPressed: ()=>Navigator.pop(context),child: Text('Close'),),
            ],
          ),
        );
      }
      );
    }
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello"),
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
              Text("here is the drawer"),
              RaisedButton(onPressed: ()=>Navigator.pop(context),child: Text('Close'),),
            ],
          ),
        ),
      ),

      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text(value),
            RaisedButton(onPressed: _selectdate, child: Text('Choose date'),),
            TextField(
              decoration: InputDecoration(
                labelText: 'hello',
                hintText: 'hi there',
                icon: Icon(Icons.people),

              ),
              autocorrect: true,
              autofocus: true,
              keyboardType: TextInputType.text,
            ),
            Slider(value: val,onChanged:_setval ,),
         Switch(value: vals,onChanged: onchange,),
         SwitchListTile(value: vals, onChanged: onchange),
            Row(
              children: [
                Text("username"),
                Expanded(
                  child: TextField(
                    controller: user,
                  ),
                )
              ],
            ),
            RaisedButton(onPressed: showbottom,child: Text("click for bottom"),),
            Card(
              child: Container(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Text("hello world"),
                    Text("im fine"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );  }
}
