import 'package:fitnestx/core/const/images_path.dart';

class PopularModel {
  final String title;
  final String image;
  final String dietType;
  final String duration;
  final String calories;


  PopularModel ({
    required this.title,
    required this.image,
    required this.dietType,
    required this.duration,
    required this.calories,
  });
}

final List<PopularModel> popularModelData = [
  PopularModel(
    title: "Blueberry Pancake",
    image: ImagePath.blueberryPancake,
    dietType: "Medium",
    duration: "30mins",
    calories: "180kCal"
  ),

  PopularModel(
    title: "Salmon Nigiri",
    image: ImagePath.salmonNigiri,
    dietType: "Medium",
    duration: "20mins",
    calories: "200kCal"
  ),

  PopularModel(
    title: "Lowfat Milk",
    image: ImagePath.lowfatMilk,
    dietType: "Easy",
    duration: "30mins",
    calories: "180kCal"
  ),

];
