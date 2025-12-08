import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/home/controller/home_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ActivityStatusCard extends StatelessWidget {
  ActivityStatusCard({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final lineBarsData = [
        LineChartBarData(
          showingIndicators: controller.showingTooltipOnSpots.toList(),
          spots: controller.allSpots,
          isCurved: false,
          barWidth: 2,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                AppColors.primaryColor2.withValues(alpha: 0.4),
                AppColors.primaryColor1.withValues(alpha: 0.1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          dotData: FlDotData(show: false),
          gradient: AppColors.appGradient1,
        ),
      ];

      final tooltipsOnBar = lineBarsData[0];
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade50,
                Colors.purple.shade50,
              ],
            ),
          ),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Heart Rate",
                      style: globalTextStyle(
                          color: AppColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "78 BPM",
                      style: globalTextStyle(
                          color: AppColors.primaryColor2,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              LineChart(
                LineChartData(
                  showingTooltipIndicators:
                  controller.showingTooltipOnSpots.map((index) {
                    return ShowingTooltipIndicators([
                      LineBarSpot(
                        tooltipsOnBar,
                        lineBarsData.indexOf(tooltipsOnBar),
                        tooltipsOnBar.spots[index],
                      ),
                    ]);
                  }).toList(),
                  lineTouchData: LineTouchData(
                    enabled: true,
                    handleBuiltInTouches: false,
                    touchCallback: (FlTouchEvent event,
                        LineTouchResponse? response) {
                      if (response == null ||
                          response.lineBarSpots == null) {
                        return;
                      }
                      if (event is FlTapUpEvent) {
                        final spotIndex =
                            response.lineBarSpots!.first.spotIndex;
                        controller.updateTooltipSpot(spotIndex);
                      }
                    },
                    mouseCursorResolver: (FlTouchEvent event,
                        LineTouchResponse? response) {
                      if (response == null ||
                          response.lineBarSpots == null) {
                        return SystemMouseCursors.basic;
                      }
                      return SystemMouseCursors.click;
                    },
                    getTouchedSpotIndicator:
                        (LineChartBarData barData,
                        List<int> spotIndexes) {
                      return spotIndexes.map((index) {
                        return TouchedSpotIndicatorData(
                          FlLine(
                            color: Colors.white,
                          ),
                          FlDotData(
                            show: true,
                            getDotPainter:
                                (spot, percent, barData, index) =>
                                FlDotCirclePainter(
                                  radius: 5,
                                  color: Colors.white,
                                  strokeWidth: 2,
                                  strokeColor: AppColors.primaryColor2,
                                ),
                          ),
                        );
                      }).toList();
                    },
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (touchedSpot) => AppColors.primaryColor2,
                      tooltipBorderRadius: BorderRadius.circular(20),
                      getTooltipItems:
                          (List<LineBarSpot> lineBarsSpot) {
                        return lineBarsSpot.map((lineBarSpot) {
                          return LineTooltipItem(
                            "${lineBarSpot.x.toInt()} mins ago",
                            globalTextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  lineBarsData: lineBarsData,
                  minY: 0,
                  maxY: 130,
                  titlesData: FlTitlesData(
                    show: false,
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
    );
  }
}