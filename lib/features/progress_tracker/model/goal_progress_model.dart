class GoalProgressModel {
  final String title;
  final int leftPercent;
  final int rightPercent;

  GoalProgressModel({
    required this.title,
    required this.leftPercent,
    required this.rightPercent,
  });
}

final List<GoalProgressModel> goalsData = <GoalProgressModel>[
  GoalProgressModel(
    title: "Lose Weight",
    leftPercent: 33,
    rightPercent: 67,
  ),
  GoalProgressModel(
    title: "Height Increase",
    leftPercent: 88,
    rightPercent: 12,
  ),
  GoalProgressModel(
    title: "Muscle Mass Increase",
    leftPercent: 57,
    rightPercent: 43,
  ),
  GoalProgressModel(
    title: "Abs",
    leftPercent: 89,
    rightPercent: 11,
  ),
];