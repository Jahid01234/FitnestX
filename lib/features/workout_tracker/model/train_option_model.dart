import 'package:fitnestx/core/const/images_path.dart';

class TrainOptionModel{
  final String image;
  final String title;
  final String exercises;
  final String duration;

  TrainOptionModel({
    required this.image,
    required this.title,
    required this.exercises,
    required this.duration,
  });
}

final List<TrainOptionModel> trainingOptions = [
  TrainOptionModel(
      image: ImagePath.goal2,
      title: "Fullbody Workout",
      exercises: "11 Exercises",
      duration: "32mins",
  ),
  TrainOptionModel(
    image: ImagePath.workOut1,
    title: "Lowebody Workout",
    exercises: "12 Exercises",
    duration: "40mins",
  ),
  TrainOptionModel(
    image: ImagePath.workOut3,
    title: "AB Workout",
    exercises: "14 Exercises",
    duration: "20mins",
  ),

];