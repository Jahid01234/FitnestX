import 'package:fitnestx/core/const/images_path.dart';

class UpcomingWorkoutModel {
  final String image;
  final String title;
  bool active;
  final String time;

  UpcomingWorkoutModel({
    required this.image,
    required this.title,
    required this.active,
    required this.time,
  });
}

final List<UpcomingWorkoutModel> upcomingWorkoutData = [
  UpcomingWorkoutModel(
      image: ImagePath.workOut2,
      title: 'Fullbody Workout',
      active: true,
      time: "Today, 03:00pm",
  ),
  UpcomingWorkoutModel(
    image: ImagePath.workOut1,
    title: 'Upperbody Workout',
    active: false,
    time: "June 05, 02:00pm",
  )
];