import 'package:fitnestx/core/const/images_path.dart';

class NotificationModel {
  final String title;
  final String timeAgo;
  final String image;

  NotificationModel({
    required this.title,
    required this.timeAgo,
    required this.image,
  });
}

final List<NotificationModel> notificationDataList = [
  NotificationModel(
    title: "Hey, it’s time for lunch",
    timeAgo: "About 1 minutes ago",
    image: ImagePath.food,
  ),
  NotificationModel(
    title: "Don’t miss your lowerbody workout",
    timeAgo: "About 3 hours ago",
    image: ImagePath.workOut2,
  ),
  NotificationModel(
    title: "Hey, let's add some meals for your body",
    timeAgo: "About 3 hours ago",
    image: ImagePath.workOut1,
  ),
  NotificationModel(
    title: "Congratulations, You have finished Activity!",
    timeAgo: "29 May",
    image: ImagePath.workOut3,
  ),
  NotificationModel(
    title: "Hey, it’s time for lunch",
    timeAgo: "8 April",
    image: ImagePath.food,
  ),
  NotificationModel(
    title: "Ups, You have missed your Lowerbody...",
    timeAgo: "3 April",
    image: ImagePath.workOut1,
  ),
];
