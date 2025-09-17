class ImgItem {
  final String imgPath;
  final String name;


  ImgItem({required this.imgPath, required this.name});
}

final List<ImgItem> items = [
  ImgItem(imgPath: "assets/imags/colectionimag/eg_flag.jpg", name: "اخبار مصر "),
  ImgItem(imgPath: "assets/imags/colectionimag/ps.png", name: "اخبار فلسطين"),
  ImgItem(imgPath: "assets/imags/colectionimag/SU.jpg", name: "اخبار السعوديه"),
];
