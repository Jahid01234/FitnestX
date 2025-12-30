import 'package:fitnestx/core/const/icons_path.dart';

class MealNutritionModel {
  final String name;
  final String image;
  final double value;
  final String unit;
  final double maxValue;

  MealNutritionModel({
    required this.name,
    required this.image,
    required this.value,
    required this.unit,
    required this.maxValue,
  });

  double get percentage => (value / maxValue).clamp(0.0, 1.0);
}

final List<MealNutritionModel> mealNutritionData = [
  MealNutritionModel(
    name: 'Calories',
    image: IconsPath.calories,
    value: 320,
    unit: 'kCal',
    maxValue: 500,
  ),
  MealNutritionModel(
    name: 'Proteins',
    image: IconsPath.proteins,
    value: 300,
    unit: 'g',
    maxValue: 500,
  ),
  MealNutritionModel(
    name: 'Fats',
    image: IconsPath.fats,
    value: 45,
    unit: 'g',
    maxValue: 100,
  ),
  MealNutritionModel(
    name: 'Carbs',
    image: IconsPath.carbo,
    value: 150,
    unit: 'g',
    maxValue: 300,
  ),
];
