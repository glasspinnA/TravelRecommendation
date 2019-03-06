import 'package:flutter/material.dart';
import 'package:travel_app/Destination.dart';

class SecondRoute extends StatelessWidget {
  final Destination destination;

  SecondRoute(this.destination);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(destination.getName()),
          backgroundColor: Color.fromRGBO(51, 51, 102, 1),
        ),
        body: Stack(
          children: <Widget>[CustomListView(destination), CustomButtonBar()],
        ));
  }
}

class CustomListView extends StatelessWidget {
  final Destination destination;

  CustomListView(this.destination);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          color: Color.fromRGBO(44, 44, 84, 1),
          child: Column(
            children: <Widget>[
              HeaderImage(destination),
              Padding(
                padding: EdgeInsets.all(20),
                child: DescriptionBox(destination.getDescriptionText()),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 50),
                child: HorizontalImages(destination.getImageList()),
              ),
            ],
          ),
        );
      },
    );
  }
}

/*
 * Widget that shows the background image for the selected destination
 */
class HeaderImage extends StatelessWidget {
  final Destination destination;

  HeaderImage(this.destination);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .90),
                  blurRadius: 350,
                  offset: Offset(0, -40))
            ],
          ),
          child: ClipPath(
            clipper: CustomShape(),
            child: Container(
              constraints: BoxConstraints.tight(new Size(400, 350)),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(
                      destination.getHeaderImage(),
                    ),
                    fit: BoxFit.cover),
              ),
              height: 150.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Container(
                      width: 70,
                      child: Text(
                        destination.getName(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            shadows: <Shadow>[
                              Shadow(
                                  offset: Offset(0, 0),
                                  color: Colors.black,
                                  blurRadius: 3)
                            ]),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 50, left: 20),
                    child: Text(
                      destination.getPrice(),
                      style: TextStyle(
                          color: Colors.green,
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(0, 0),
                                blurRadius: 10,
                                color: Colors.black)
                          ],
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/*
 *  Widget that shows the descripton for the destination
 */
class DescriptionBox extends StatelessWidget {
  final String descriptionText;
  DescriptionBox(this.descriptionText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Overview",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ],
        ),
        Text(
          descriptionText,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

/*
 * Widget that shows the horizontal aligned images for the destination
 */
class HorizontalImages extends StatelessWidget {
  final List<String> imageList;

  HorizontalImages(this.imageList);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomImage(imageList[index]);
        },
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  final String imagePath;

  CustomImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      margin: EdgeInsets.only(right: 20),
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: Color.fromRGBO(44, 44, 84, .5), width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

/*
 * Widget for the button bar 
 */
class CustomButtonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(245, 59, 87, 1),
                  Color.fromRGBO(239, 87, 119, 1),
                ],
                tileMode: TileMode.repeated)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Book Now",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_right),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

/*
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
