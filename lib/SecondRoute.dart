import 'package:flutter/material.dart';

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
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: <Widget>[
                HeaderImage(),
                DescriptionBox(),
                HorizontalImages(),
                CustomButtonBar()
              ],
            ),
          );
        },
      ),
    );
  }
}

/**
 * Widget that shows the background image for the selected destination
 */
class HeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}

/**
 *  Widget that shows the descripton for the destination
 */
class DescriptionBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Text("Header"), Text("BOdy")],
    );
  }
}

/**
 * Widget that shows the horizontal aligned images for the destination
 */
class HorizontalImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

/**
 * Widget for the button bar 
 */
class CustomButtonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: <Widget>[Text("Button Bar"), Icon(Icons.wifi)],
    );
  }
}

/**
 * Clipper that gives the header image that flowing feeling
 */
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
