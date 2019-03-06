class Destination {
  String image;
  String destinationName;
  String bodyText;
  List<String> images = new List();
  String price;

  Destination(
      this.destinationName, this.bodyText, this.image, this.images, this.price);

  getName() {
    return this.destinationName;
  }

  getDescriptionText() {
    return this.bodyText;
  }

  getHeaderImage() {
    return this.image;
  }

  getImageList() {
    return this.images;
  }

  getPrice() {
    return this.price;
  }
}
