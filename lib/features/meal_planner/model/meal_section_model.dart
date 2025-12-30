import 'package:fitnestx/core/const/images_path.dart';

class MealSectionModel {
  final String sectionTitle;
  final String totalMeals;
  final String totalCalories;
  final List<MealItemModel> items;

  MealSectionModel({
    required this.sectionTitle,
    required this.totalMeals,
    required this.totalCalories,
    required this.items,
  });
}



class MealItemModel {
  final String title;
  final String time;
  final String image;


  MealItemModel({
    required this.title,
    required this.time,
    required this.image,
  });
}




final List<MealSectionModel> mealSectionsData = [
  MealSectionModel(
    sectionTitle: "Breakfast",
    totalMeals: "2 meals",
    totalCalories: "230 calories",
    items: [
      MealItemModel(
        title: "Honey Pancake",
        time: "07:00am",
        image: ImagePath.pancake,
      ),
      MealItemModel(
        title: "Coffee",
        time: "07:30am",
        image: ImagePath.coffee,
      ),
    ],
  ),

  MealSectionModel(
    sectionTitle: "Lunch",
    totalMeals: "2 meals",
    totalCalories: "500 calories",
    items: [
      MealItemModel(
        title: "Chicken Steak",
        time: "01:00pm",
        image: ImagePath.chickenSteak,
      ),
      MealItemModel(
        title: "Milk",
        time: "01:20pm",
        image: ImagePath.lowfatMilk,
      ),
    ],
  ),

  MealSectionModel(
    sectionTitle: "Snacks",
    totalMeals: "2 meals",
    totalCalories: "140 calories",
    items: [
      MealItemModel(
        title: "Orange",
        time: "04:30pm",
        image: ImagePath.orange,
      ),
      MealItemModel(
        title: "Apple Pie",
        time: "04:40pm",
        image: ImagePath.applePie,
      ),
    ],
  ),

  MealSectionModel(
    sectionTitle: "Dinner",
    totalMeals: "2 meals",
    totalCalories: "120 calories",
    items: [
      MealItemModel(
        title: "Salad",
        time: "07:10pm",
        image: ImagePath.fruitSalad,
      ),
      MealItemModel(
        title: "Oatmeal",
        time: "08:10pm",
        image: ImagePath.oatmeal,
      ),
    ],
  ),
];

