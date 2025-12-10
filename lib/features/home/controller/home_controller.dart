import 'package:fitnestx/features/home/model/workout_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  RxList<WorkoutModel> workoutsDataList = <WorkoutModel>[].obs;



  @override
  void onInit() {
    super.onInit();
    loadWorkout();
  }

  void loadWorkout() {
    workoutsDataList.value = workouts;
  }



  var showingTooltipOnSpots = <int>[21].obs;
  List waterArr = [
    {"title": "6am - 8am", "subtitle": "600ml"},
    {"title": "9am - 11am", "subtitle": "500ml"},
    {"title": "11am - 2pm", "subtitle": "1000ml"},
    {"title": "2pm - 4pm", "subtitle": "700ml"},
    {"title": "4pm - now", "subtitle": "900ml"},
  ];

  List<FlSpot> get allSpots => const [
    FlSpot(0, 20),
    FlSpot(1, 30),
    FlSpot(2, 40),
    FlSpot(3, 50),
    FlSpot(4, 30),
    FlSpot(5, 40),
    FlSpot(6, 30),
    FlSpot(7, 20),
    FlSpot(8, 30),
    FlSpot(9, 40),
    FlSpot(10, 50),
    FlSpot(11, 30),
    FlSpot(12, 50),
    FlSpot(13, 60),
    FlSpot(14, 40),
    FlSpot(15, 50),
    FlSpot(16, 30),
    FlSpot(17, 20),
    FlSpot(18, 40),
    FlSpot(19, 50),
    FlSpot(20, 30),
    FlSpot(21, 80),
    FlSpot(22, 30),
    FlSpot(23, 20),
    FlSpot(24, 30),
    FlSpot(25, 40),
    FlSpot(26, 50),
    FlSpot(27, 30),
    FlSpot(28, 50),
    FlSpot(29, 60),
    FlSpot(30, 40)
  ];

  void updateTooltipSpot(int spotIndex) {
    showingTooltipOnSpots.clear();
    showingTooltipOnSpots.add(spotIndex);
  }


  // workout process ........
  var selectedDay = 2.obs; // Friday index
  var period = 'Weekly'.obs;

  final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final List<double> dataPoints = [20, 60, 20, 80, 50 ,20, 80,];
  final List<double> dataPointss = [40, 10, 80, 24, 64, 70, 20,];

  void selectDay(int index) {
    selectedDay.value = index;
  }

  void changePeriod() {
    // Toggle between periods
    if (period.value == 'Weekly') {
      period.value = 'Monthly';
    } else {
      period.value = 'Weekly';
    }
  }
}
