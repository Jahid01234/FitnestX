import 'package:fitnestx/core/const/images_path.dart';

class RecommendationDietModel {
  final String title;
  final String image;
  final String dietType;
  final String duration;
  final String calories;


  RecommendationDietModel({
    required this.title,
    required this.image,
    required this.dietType,
    required this.duration,
    required this.calories,
  });
}

final List<RecommendationDietModel> recommendationDietData = [
  RecommendationDietModel(
    title: "Honey Pancake",
    image: ImagePath.pancake,
    dietType: "Easy",
    duration: "30mins",
    calories: "180kCal"
  ),

  RecommendationDietModel(
    title: "Canai Bread",
    image: ImagePath.beef,
    dietType: "Easy",
    duration: "20mins",
    calories: "200kCal"
  ),

  RecommendationDietModel(
    title: "Bread",
    image: ImagePath.bread,
    dietType: "Easy",
    duration: "30mins",
    calories: "180kCal"
  ),

];
