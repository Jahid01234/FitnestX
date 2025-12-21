class WorkoutEvent {
  final String title;
  final DateTime dateTime;
  final double duration;
  final bool isBlue;
  final String startTime;
  final String endTime;
  final String difficulty;
  final int repetitions;
  final int weights;
  bool isDone;

  WorkoutEvent({
    required this.title,
    required this.dateTime,
    required this.duration,
    required this.isBlue,
    required this.startTime,
    required this.endTime,
    required this.difficulty,
    required this.repetitions,
    required this.weights,
    this.isDone = false,
  });
}