class Destination {
  String image;
  String destinationName;
  String bodyText;
  List<String> images = new List();
  String price;

  Destination(
    this.destinationName,
    this.bodyText,
  );

  getName() {
    return this.destinationName;
  }

  getDescriptionText() {
    return bodyText;
  }
}
