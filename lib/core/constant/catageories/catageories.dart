import 'dart:ui';

class Catageories {
  String id;
  String name;
  String images;

  Catageories({
    required this.name,
    required this.images,
    required this.id,
  });

  static List<Catageories> CatageoriesInfo = [
    Catageories(id: "general",name: "General", images: "assets/images/general.png"),
    Catageories(id: "business",name: "Business", images: "assets/images/bussiness.png"),
    Catageories(id: "entertainment",name: "Entertainment", images: "assets/images/entertaiment.png"),
    Catageories(id: "health",name: "Health", images: "assets/images/medical.png"),
    Catageories(id: "science",name: "Science", images: "assets/images/science.png"),
    Catageories(id: "technology",name: "Technology", images: "assets/images/technology.png"),
    Catageories(id: "sport",name: "Sport", images: "assets/images/sport.png"),
  ];
}