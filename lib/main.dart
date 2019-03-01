import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final title = "List demo";
    List<String> listText = new List();
    listText.add("1");
    listText.add("1");
    listText.add("1");
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.yellow),
        home: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: ListView.builder(
              itemCount: listText.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 150.0,
                  height: 270.0,
                  child: Card(
                    child: Stack(
                      children: <Widget>[
                        Container(
                            child: Text(
                              "Hello World",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            alignment: Alignment.center,
                            constraints: BoxConstraints.expand(),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: ExactAssetImage("assets/jonna2.jpg"),
                                    fit: BoxFit.cover)))
                      ],
                    ),
                  ),
                );
              },
            )));
  }
}
