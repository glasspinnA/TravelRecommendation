import 'package:flutter/material.dart';
import 'package:travel_app/Destination.dart';
import 'package:travel_app/SecondRoute.dart';

void main() => runApp(MaterialApp(
      title: 'MyApp',
      home: TravelListRoute(),
    ));

class TravelListRoute extends StatelessWidget {
  final title = "List demo";
  List<Destination> listText = new List();

  TravelListRoute() {
    listText.add(new Destination(
      "London",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vulputate erat vitae egestas viverra. Aliquam erat volutpat. Donec at vulputate diam. Nullam vehicula tempor maximus. Etiam erat est, cursus et eleifend eu, posuere eget risus. Phasellus sollicitudin dui sit amet metus vestibulum, vel venenatis leo aliquet. Etiam fringilla molestie lectus quis mollis. Nunc maximus nisl sed consectetur pharetra. Donec nisl nulla, lacinia eleifend risus vulputate, tincidunt maximus ante. Aenean vel nisl orci.",
      "assets/london/london-1.jpg",
      [
        "assets/london/london-2.jpg",
        "assets/london/london-3.jpg",
        "assets/london/london-4.jpg"
      ],
    ));

    debugPrint(listText.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: listText.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 150.0,
            height: 270.0,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondRoute(listText[index]),
                  ),
                );
              },
              child: CustomCard(listText, index),
            ),
          );
        },
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final List<Destination> listText;
  final int index;

  CustomCard(this.listText, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(5, 10, 10, 5),
      child: Stack(
        children: <Widget>[
          Container(
            child: Text(
              listText[index].getName().toString(),
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            alignment: Alignment.center,
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage(listText[index].getHeaderImage()),
                  fit: BoxFit.cover),
            ),
          )
        ],
      ),
    );
  }
}
