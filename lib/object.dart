class PopImage {
  bool isShow = true;
  double x, y, width, height;
  String path2Image;
  String imageName;
  String imageText;
  List<String> prompts;

  PopImage(
    this.x,
    this.y,
    this.width,
    this.height,
    this.path2Image,
    this.imageName,
    this.imageText,
    this.prompts,
  );
}
