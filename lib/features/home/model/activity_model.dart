import 'package:fitnestx/core/const/images_path.dart';

class ActivityModel{
  final String title;
  final String timeAgo;
  final String image;

  ActivityModel({
    required this.title,
    required this.timeAgo,
    required this.image,
  });
}

final List<ActivityModel> activityDataList = [
  ActivityModel(
    title: "Drinking 300ml Water",
    timeAgo: "About 1 minutes ago",
    image: ImagePath.activityImg1,
  ),
  ActivityModel(
    title: "Eat Snack (Fitbar)",
    timeAgo: "About 3 hours ago",
    image: ImagePath.activityImg2,
  ),
  ActivityModel(
    title: "Hey, let's add some meals for your body",
    timeAgo: "About 3 hours ago",
    image: ImagePath.activityImg1,
  ),
  ActivityModel(
    title: "Congratulations, You have finished Activity!",
    timeAgo: "29 May",
    image: ImagePath.activityImg2,
  ),
  ActivityModel(
    title: "Hey, it’s time for lunch",
    timeAgo: "8 April",
    image: ImagePath.activityImg1,
  ),
  ActivityModel(
    title: "Ups, You have missed your Lowerbody...",
    timeAgo: "3 April",
    image: ImagePath.activityImg2,
  ),
];
