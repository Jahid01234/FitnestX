import 'package:fitnestx/core/const/images_path.dart';

class TrainOptionModel {
  final String image;
  final String title;
  final String exercises;
  final String duration;
  final String calories;

  TrainOptionModel({
    required this.image,
    required this.title,
    required this.exercises,
    required this.duration,
    required this.calories,
  });
}

final List<TrainOptionModel> trainingOptions = [
  TrainOptionModel(
    image: ImagePath.goal2,
    title: "Fullbody Workout",
    exercises: "11 Exercises",
    duration: "32mins",
    calories: "320 Calories Burn",
  ),
  TrainOptionModel(
    image: ImagePath.workOut1,
    title: "Lowebody Workout",
    exercises: "12 Exercises",
    duration: "40mins",
    calories: "120 Calories Burn",
  ),
  TrainOptionModel(
    image: ImagePath.workOut3,
    title: "AB Workout",
    exercises: "14 Exercises",
    duration: "20mins",
    calories: "200 Calories Burn",
  ),
];
