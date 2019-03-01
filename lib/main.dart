import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final title = "List demo";
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.yellow),
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.map),
                title: Text("Map"),
              ),
              ListTile(leading: Icon(Icons.access_alarm), title: Text("Alarm")),
              ListTile(trailing: Icon(Icons.work), title: Text("Travel"))
            ],
          ),
        ));
  }
}
