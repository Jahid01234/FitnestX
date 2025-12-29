import 'package:fitnestx/core/const/images_path.dart';


class IngredientsModel {
  final String title;
  final String quantity;
  final String image;

  IngredientsModel ({
    required this.title,
    required this.quantity,
    required this.image,
  });
}



final List<IngredientsModel> ingredientsModelData = [
  IngredientsModel(
      title: "Wheat Flour",
      quantity: "100gr",
      image: ImagePath.wheatFlour,
  ),
  IngredientsModel(
      title: "Sugar",
      quantity: "3 tbsp",
      image: ImagePath.sugar,
  ),
  IngredientsModel(
      title: "Baking Soda",
      quantity: "2 tsp",
      image: ImagePath.bakingSoda,
  ),
  IngredientsModel(
      title: "Eggs",
      quantity: "2 items",
      image: ImagePath.eggs,
  ),


];
