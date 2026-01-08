import 'package:fitnestx/features/progress_tracker/model/facing_progress_model.dart';
import 'package:fitnestx/features/progress_tracker/model/goal_progress_model.dart';
import 'package:get/get.dart';

class CompareResultController extends GetxController{
  RxList<FacingProgressModel> facingDataList = <FacingProgressModel>[].obs;
  RxList<GoalProgressModel> goalProgressList = <GoalProgressModel>[].obs;
  RxInt selectedIndex = 0.obs;
  var selectedDay = 2.obs;
  final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final List<double> dataPoints = [20, 60, 20, 80, 50 ,20, 80,];
  final List<double> dataPointss = [40, 10, 80, 20, 50, 70, 20,];


  @override
  void onInit() {
    super.onInit();
    loadFacingData();
    loadGoalProgressData();
  }

  void loadFacingData(){
    facingDataList.value =  facingData;
  }

  void loadGoalProgressData(){
    goalProgressList.value =  goalsData;
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  void selectDay(int index) {
    selectedDay.value = index;
  }


}
