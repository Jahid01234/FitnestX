import 'dart:ui';
import 'package:fitnestx/core/const/images_path.dart';

class MealOptionModel {
  final String title;
  final String foodCount;
  final String image;
  final Color bgColor;
  final Color buttonColor;

  MealOptionModel({
    required this.title,
    required this.foodCount,
    required this.image,
    required this.bgColor,
    required this.buttonColor,
  });
}

final List<MealOptionModel> mealOptionData = [
  MealOptionModel(
    title: "Breakfast",
    foodCount: "120+ Foods",
    image: ImagePath.bread,
    bgColor: Color(0xFFEFF4FF),
    buttonColor: Color(0xFF9BB7FF),
  ),
  MealOptionModel(
    title: "Lunch",
    foodCount: "130+ Foods",
    image: ImagePath.beef,
    bgColor: Color(0xFFFFF0F7),
    buttonColor: Color(0xFFE8A6DA),
  ),
];
