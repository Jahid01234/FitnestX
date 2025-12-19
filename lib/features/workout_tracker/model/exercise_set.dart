import 'package:fitnestx/core/const/images_path.dart';

class ExerciseModel {
  final String image;
  final String title;
  final String duration;
  final String calories;
  final String descriptions;

  ExerciseModel({
    required this.image,
    required this.title,
    required this.duration,
    required this.calories,
    required this.descriptions,
  });
}

class ExerciseSet {
  final int setId;
  final String setName;
  final List<ExerciseModel> exercises;

  ExerciseSet({
    required this.setId,
    required this.setName,
    required this.exercises,
  });

  static final List<ExerciseSet> exerciseSetData = [
    ExerciseSet(
      setId: 1,
      setName: "Set 1",
      exercises: [
        ExerciseModel(
          image: ImagePath.warmUp,
          title: "Warm Up",
          duration: "05:00",
          calories: "320 Calories Burn",
          descriptions:
              "Warm-up exercises prepare your body for activity by "
              "increasing blood flow and range of motion, preventing injury with "
              "dynamic movements like Jumping Jacks, Arm Circles, Bodyweight Squats,"
              " Lunges (with twists), Knee Hugs, Leg Swings, and Mountain Climbers."
              " Focus on light cardio and dynamic stretches that mimic your workout's "
              "movements to gradually raise your heart rate and get muscles ready for exertion.",
        ),
        ExerciseModel(
          image: ImagePath.jumpingJack,
          title: "Jumping Jack",
          duration: "12x",
          calories: "390 Calories Burn",
          descriptions:
              "A jumping jack, also known as a star jump and called a"
              " side-straddle hop in the US military, is a physical jumping exercise"
              " performed by jumping to a position with the legs spread wide",
        ),
        ExerciseModel(
          image: ImagePath.skipping,
          title: "Skipping",
          duration: "15x",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
        ExerciseModel(
          image: ImagePath.squats,
          title: "Squats",
          duration: "20x",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
        ExerciseModel(
          image: ImagePath.armRaises,
          title: "Arm Raises",
          duration: "00:53",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
        ExerciseModel(
          image: ImagePath.restDrink,
          title: "Rest and Drink",
          duration: "02:00",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
      ],
    ),

    ExerciseSet(
      setId: 2,
      setName: "Set 2",
      exercises: [
        ExerciseModel(
          image: ImagePath.inclinePushUp,
          title: "Incline Push-Ups",
          duration: "12x",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
        ExerciseModel(
          image: ImagePath.pushUp,
          title: "Push-Ups",
          duration: "15x",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
        ExerciseModel(
          image: ImagePath.skipping,
          title: "Skipping",
          duration: "15x",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
        ExerciseModel(
          image: ImagePath.squats,
          title: "Squats",
          duration: "20x",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
        ExerciseModel(
          image: ImagePath.armRaises,
          title: "Arm Raises",
          duration: "00:53",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
        ExerciseModel(
          image: ImagePath.restDrink,
          title: "Rest and Drink",
          duration: "02:00",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
      ],
    ),

    ExerciseSet(
      setId: 3,
      setName: "Set 3",
      exercises: [
        ExerciseModel(
          image: ImagePath.skipping,
          title: "Skipping",
          duration: "15x",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
        ExerciseModel(
          image: ImagePath.squats,
          title: "Squats",
          duration: "20x",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
        ExerciseModel(
          image: ImagePath.armRaises,
          title: "Arm Raises",
          duration: "00:53",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
        ExerciseModel(
          image: ImagePath.restDrink,
          title: "Rest and Drink",
          duration: "02:00",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
        ExerciseModel(
          image: ImagePath.inclinePushUp,
          title: "Incline Push-Ups",
          duration: "12x",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
        ExerciseModel(
          image: ImagePath.pushUp,
          title: "Push-Ups",
          duration: "15x",
          calories: "390 Calories Burn",
          descriptions: "This is description......",
        ),
      ],
    ),
  ];
}
