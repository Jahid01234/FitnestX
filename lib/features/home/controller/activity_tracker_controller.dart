import 'package:fitnestx/features/home/model/activity_model.dart';
import 'package:get/get.dart';

class ActivityTrackerController extends GetxController{

  RxList<ActivityModel> activityData = <ActivityModel>[].obs;
  var period = 'Weekly'.obs;



  @override
  void onInit() {
    super.onInit();
    loadActivity();
  }

  void loadActivity() {
    activityData.value = activityDataList;
  }



  /// Week day names stored inside controller
  RxList<String> weekDays = <String>[
    "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"
  ].obs;

  /// Weekly chart values (0–100)
  RxList<double> weeklyData = <double>[
    40, 90, 70, 85, 100, 30, 80
  ].obs;

  void changePeriod() {
    // Toggle between periods
    if (period.value == 'Weekly') {
      period.value = 'Monthly';
    } else {
      period.value = 'Weekly';
    }
  }
}
