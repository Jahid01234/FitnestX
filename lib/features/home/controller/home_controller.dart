import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  var showingTooltipOnSpots = <int>[21].obs;

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
}
