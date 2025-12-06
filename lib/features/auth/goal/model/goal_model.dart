import 'package:fitnestx/core/const/images_path.dart';

class GoalModel{
  final String title;
  final String subTitle;
  final String image;

  GoalModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });

}

List<GoalModel> goalItemsListData = [
  GoalModel(
    title: "Improve Shape",
    subTitle: "I have a low amount of body fat and need / want to build more muscle",
    image: ImagePath.goal1,
  ),
  GoalModel(
    title: "Lean & Tone",
    subTitle: "I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way",
    image: ImagePath.goal2,
  ),
  GoalModel(
    title: "Lose a Fat",
    subTitle: "I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass",
    image: ImagePath.goal3,
  ),

];