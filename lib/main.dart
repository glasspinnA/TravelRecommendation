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

class SecondRoute extends StatelessWidget {
  SecondRoute(int index) {
    debugPrint(index.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CustomShape(),
                  child: Container(
                    height: 150.0,
                    child: Text(
                      "Sweden",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    constraints: BoxConstraints.tight(new Size(400, 350)),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage("assets/jonna2.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();

    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width * .5, size.height - 35.0);
    var firstControlPonint = Offset(size.width * .5, size.height - 50.0);
    path.quadraticBezierTo(firstControlPonint.dx, firstControlPonint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 80.0);
    var secondControlPonint = Offset(size.width * .5, size.height - 10.0);
    path.quadraticBezierTo(secondControlPonint.dx, secondControlPonint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

/*
Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 160.0,
                        color: Colors.red,
                      ),
                      Container(
                        width: 160.0,
                        color: Colors.blue,
                      ),
                      Container(
                        width: 160.0,
                        color: Colors.green,
                      ),
                      Container(
                        width: 160.0,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: 160.0,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
*/
