import 'package:fitnestx/core/const/images_path.dart';

class WorkoutModel {
  final String title;
  final String calories;
  final String duration;
  final String image;
  final double progress;

  WorkoutModel({
    required this.title,
    required this.calories,
    required this.duration,
    required this.image,
    required this.progress,
  });
}

 final List<WorkoutModel> workouts = [
  WorkoutModel(
    title: "Fullbody Workout",
    calories: "180 Calories Burn",
    duration: "20 minutes",
    image: ImagePath.workOut1,
    progress: 0.4,
  ),
  WorkoutModel(
    title: "Lowerbody Workout",
    calories: "200 Calories Burn",
    duration: "30 minutes",
    image: ImagePath.workOut2,
    progress: 0.6,
  ),
   WorkoutModel(
     title: "Ab Workout",
     calories: "200 Calories Burn",
     duration: "30 minutes",
     image: ImagePath.workOut3,
     progress: 0.6,
   ),
   WorkoutModel(
     title: "Fullbody Workout",
     calories: "180 Calories Burn",
     duration: "20 minutes",
     image: ImagePath.workOut1,
     progress: 0.4,
   ),
   WorkoutModel(
     title: "Lowerbody Workout",
     calories: "200 Calories Burn",
     duration: "30 minutes",
     image: ImagePath.workOut2,
     progress: 0.6,
   ),
   WorkoutModel(
     title: "Ab Workout",
     calories: "200 Calories Burn",
     duration: "30 minutes",
     image: ImagePath.workOut3,
     progress: 0.6,
   ),
];
