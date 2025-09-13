class ImgItem {
  final String imgPath;
  final String name;

  ImgItem({required this.imgPath, required this.name});
}

final List<ImgItem> items = [
  ImgItem(imgPath: "assets/business.jpg", name: "business"),
  ImgItem(imgPath: "assets/entrtemnt.png", name: "entrtemnt"),
  ImgItem(imgPath: "assets/genral.jpg", name: "genral"),
  ImgItem(imgPath: "assets/helth.jpg", name: "helth"),
  ImgItem(imgPath: "assets/science.jpg", name: "science"),
  ImgItem(imgPath: "assets/sport.jpeg", name: "sport"),
  ImgItem(imgPath: "assets/tech.jpg", name: "tech"),
];
