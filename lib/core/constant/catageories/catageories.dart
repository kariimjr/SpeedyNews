import 'dart:ui';

class Catageories {
  String name;
  String images;

  Catageories({
    required this.name,
    required this.images,
  });

  static List<Catageories> CatageoriesInfo = [
    Catageories(name: "General", images: "assets/images/general.png"),
    Catageories(name: "Business", images: "assets/images/bussiness.png"),
    Catageories(name: "Entertainment", images: "assets/images/entertaiment.png"),
    Catageories(name: "Health", images: "assets/images/medical.png"),
    Catageories(name: "Science", images: "assets/images/science.png"),
    Catageories(name: "Technology", images: "assets/images/technology.png"),
    Catageories(name: "Sport", images: "assets/images/sport.png"),
  ];
}