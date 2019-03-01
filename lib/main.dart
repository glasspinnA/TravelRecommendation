import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'MyApp',
      home: TravelListRoute(),
    ));

class TravelListRoute extends StatelessWidget {
  final title = "List demo";
  final List<String> listText = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 150.0,
            height: 270.0,
            child: InkWell(
              onTap: () {
                debugPrint("hello");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondRoute(index)));
              },
              child: Card(
                margin: EdgeInsets.fromLTRB(5, 10, 10, 5),
                child: Stack(
                  children: <Widget>[
                    Container(
                        child: Text(
                          'Hello World!',
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
            ),
          );
        },
      ),
    );
  }
}
