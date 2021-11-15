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
class Choice{
  final String title;
  final IconData icon;
  const Choice({this.title,this.icon});
}
class _State extends State<myApp> with SingleTickerProviderStateMixin{
  TabController controller;
  List<Choice>items=const <Choice>[
    const Choice(title: 'Car',icon: Icons.directions_car),
    const Choice(title: 'Bicycle',icon: Icons.directions_bike),
    const Choice(title: 'Boat',icon: Icons.directions_boat),
    const Choice(title: 'Bus',icon: Icons.directions_bus),
    const Choice(title: 'Train',icon: Icons.directions_railway),
    const Choice(title: 'Walk',icon: Icons.directions_walk
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    controller=new TabController(length: items.length,vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello"),
        bottom: new PreferredSize(child: Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.white),
          child: Container(
            height: 48.0,
            alignment: Alignment.center,
            child: TabPageSelector(
              controller: controller,
            ),
          ),
        ), preferredSize: const Size.fromHeight(48.0),),
      ),
      body:
        TabBarView(
          controller: controller,
          children: items.map((Choice item){
            return Container(
              padding: EdgeInsets.all(25.0),
              child: Center(
                child: Column(
                  children: [
                    Text(item.title),
                    Icon(
                      item.icon,size: 120.0,
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
    );
  }
}
