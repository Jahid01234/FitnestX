import 'package:get/get.dart';

class SleepTrackerController extends GetxController{
  final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  final List<double> chartData = [4, 6, 5, 7, 6, 8, 9]; // hours

  RxInt selectedDayIndex = 4.obs;

  double get selectedValue => chartData[selectedDayIndex.value];

  void selectDay(int index) {
    selectedDayIndex.value = index;
  }
}