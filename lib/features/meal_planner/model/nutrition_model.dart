import 'package:fitnestx/core/const/icons_path.dart';


class NutritionModel {
  final String calories;
  final String image;

  NutritionModel ({
    required this.calories,
    required this.image,
  });
}



final List<NutritionModel> nutritionModelData = [
  NutritionModel(
    calories: "180kCal",
    image: IconsPath.calories,
  ),
  NutritionModel(
    calories: "30g fats",
    image: IconsPath.fats,
  ),
  NutritionModel(
    calories: "20g proteins",
    image: IconsPath.proteins,
  ),
  NutritionModel(
    calories: "50g carbo",
    image: IconsPath.carbo,
  ),
];
