import 'package:fitnestx/features/workout_tracker/model/train_option_model.dart';
import 'package:fitnestx/features/workout_tracker/model/upcoming_workout_model.dart';
import 'package:get/get.dart';

class WorkoutTrackerController extends GetxController{

  RxList<UpcomingWorkoutModel> upcomingWorkoutList = <UpcomingWorkoutModel>[].obs;
  RxList<TrainOptionModel> trainOptionList = <TrainOptionModel>[].obs;
  var selectedDay = 2.obs;
  final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final List<double> dataPoints = [20, 60, 20, 80, 50 ,20, 80,];
  final List<double> dataPointss = [40, 10, 80, 15, 60, 70, 20,];

  @override
  void onInit() {
    super.onInit();
    loadUpcomingWorkout();
    loadTrainOptionData();
  }

  void loadUpcomingWorkout(){
    upcomingWorkoutList.value = upcomingWorkoutData;
  }
  void loadTrainOptionData(){
    trainOptionList.value = trainingOptions;
  }

  void selectDay(int index) {
    selectedDay.value = index;
  }

  void toggleWorkout(int index, bool value) {
    upcomingWorkoutList[index].active = value;
    upcomingWorkoutList.refresh();
  }

}