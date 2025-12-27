import 'package:fitnestx/core/const/icons_path.dart';


class CategoryModel {
  final String image;
  final String title;

  CategoryModel({
    required this.image,
    required this.title,
  });
}

final List<CategoryModel> categoryData = [
  CategoryModel(
      image: IconsPath.salad,
      title: 'Salad',
  ),
  CategoryModel(
    image: IconsPath.cake,
    title: 'Cake',
  ),
  CategoryModel(
    image: IconsPath.pie,
    title: 'Pie',
  ),
  CategoryModel(
    image: IconsPath.smoothies,
    title: 'Smoothies',
  )
];