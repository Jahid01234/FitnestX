import 'package:fitnestx/core/const/images_path.dart';

class MealsModel {
  final String image;
  final String title;
  bool active;
  final String time;

  MealsModel({
    required this.image,
    required this.title,
    required this.active,
    required this.time,
  });
}

final List<MealsModel> mealsDataList = [
  MealsModel(
      image: ImagePath.salmonNigiri,
      title: 'Salmon Nigiri',
      active: true,
      time: "Today | 7am",
  ),
  MealsModel(
    image: ImagePath.lowfatMilk,
    title: 'Lowfat Milk',
    active: false,
    time: "Today | 8am",
  )
];