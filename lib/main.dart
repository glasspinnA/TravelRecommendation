import 'package:flutter/material.dart';
import 'package:travel_app/Destination.dart';
import 'package:travel_app/SecondRoute.dart';

void main() => runApp(MaterialApp(title: 'MyApp', home: TravelListRoute()));

class TravelListRoute extends StatelessWidget {
  final title = "List demo";
  List<Destination> listText = new List();

  TravelListRoute() {
    listText.add(new Destination(
      "London",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vulputate erat vitae egestas viverra. Aliquam erat volutpat. Donec at vulputate diam. Nullam vehicula tempor maximus. Etiam erat est, cursus et eleifend eu, posuere eget risus. Phasellus sollicitudin dui sit amet metus vestibulum, vel venenatis leo aliquet. Etiam fringilla molestie lectus quis mollis. Nunc maximus nisl sed consectetur pharetra. Donec nisl nulla, lacinia eleifend risus vulputate, tincidunt maximus ante. Aenean vel nisl orci.",
      "assets/london/1.jpg",
      ["assets/london/2.jpg", "assets/london/3.jpg", "assets/london/4.jpg"],
    ));

    listText.add(new Destination(
      "Tokyo",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vulputate erat vitae egestas viverra. Aliquam erat volutpat. Donec at vulputate diam. Nullam vehicula tempor maximus. Etiam erat est, cursus et eleifend eu, posuere eget risus. Phasellus sollicitudin dui sit amet metus vestibulum, vel venenatis leo aliquet. Etiam fringilla molestie lectus quis mollis. Nunc maximus nisl sed consectetur pharetra. Donec nisl nulla, lacinia eleifend risus vulputate, tincidunt maximus ante. Aenean vel nisl orci.",
      "assets/london/1.jpg",
      ["assets/london/2.jpg", "assets/london/3.jpg", "assets/london/4.jpg"],
    ));

    debugPrint(listText.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Color.fromRGBO(51, 51, 102, .9),
        ),
        body: Container(
          color: Color.fromRGBO(44, 44, 84, 1),
          child: ListView.builder(
            itemCount: listText.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    height: 210.0,
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
                  ));
            },
          ),
        ));
  }
}

class CustomCard extends StatelessWidget {
  final List<Destination> listText;
  final int index;

  CustomCard(this.listText, this.index);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: Card(
        child: Stack(
          children: <Widget>[
            Container(
              child: Text(
                listText[index].getName().toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  shadows: <Shadow>[
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black,
                    ),
                  ],
                ),
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
      ),
    );
  }
}
