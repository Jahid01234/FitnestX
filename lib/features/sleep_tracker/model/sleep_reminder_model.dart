import 'package:fitnestx/core/const/icons_path.dart';

class SleepReminderModel {
  final String title;
  final String time;
  final String subtitle;
  final String iconPath;
  bool isEnabled;

  SleepReminderModel({
    required this.title,
    required this.time,
    required this.subtitle,
    required this.iconPath,
    this.isEnabled = true,
  });
}

 final List<SleepReminderModel> sleepReminderData = [
   SleepReminderModel(
     title: "Bedtime",
     time: "09:00pm",
     subtitle: "in 6hours 22minutes",
     iconPath: IconsPath.bed,
   ),
   SleepReminderModel(
     title: "Alarm",
     time: "05:10am",
     subtitle: "in 14hours 30minutes",
     iconPath: IconsPath.alarm,
   ),

 ];