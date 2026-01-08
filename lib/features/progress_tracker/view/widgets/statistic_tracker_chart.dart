import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/progress_tracker/controller/compare_result_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticTrackerChart extends StatelessWidget {
  final CompareResultController controller;

  const StatisticTrackerChart({
    super.key,
    required this.controller,
  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 260,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            /// The chart
            LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 20,
                  getDrawingHorizontalLine: (value) =>
                      FlLine(color: Colors.grey[200]!, strokeWidth: 1),
                ),

                titlesData: FlTitlesData(
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 20,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            '${value.toInt()}%',
                            style: globalTextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index < 0 || index >= controller.days.length) {
                          return SizedBox();
                        }
                        bool selected =
                            controller.selectedDay.value == index;
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            controller.days[index],
                            style: globalTextStyle(
                              color: selected
                                  ? AppColors.secondaryColor1
                                  : Colors.grey,
                              fontWeight: selected
                                  ? FontWeight.w800
                                  : FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 6,
                minY: -0.5,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    spots: controller.dataPoints
                        .asMap()
                        .entries
                        .map((e) => FlSpot(e.key.toDouble(), e.value))
                        .toList(),
                    isCurved: true,
                    curveSmoothness: 0.35,
                    color: AppColors.primaryColor1,
                    barWidth: 1,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                  ),

                  LineChartBarData(
                    spots: controller.dataPointss
                        .asMap()
                        .entries
                        .map((e) => FlSpot(e.key.toDouble(), e.value))
                        .toList(),
                    isCurved: true,
                    curveSmoothness: 0.35,
                     color: AppColors.secondaryColor2,
                    barWidth: 1,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        bool isSelected =
                            index == controller.selectedDay.value;

                        if (!isSelected) {
                          return FlDotCirclePainter(radius: 0);
                        }
                        return FlDotCirclePainter(
                          radius: 4,
                          color: Colors.white,
                          strokeWidth: 1,
                          strokeColor: Color(0xFF92A3FD),
                        );
                      },
                    ),

                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF92A3FD).withValues(alpha: 0.15),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],

                // TOUCH LOGIC
                lineTouchData: LineTouchData(
                  touchCallback: (event, response) {
                    if (response != null &&
                        response.lineBarSpots != null &&
                        response.lineBarSpots!.isNotEmpty) {
                      int index = response.lineBarSpots!.first.x.toInt();
                      controller.selectDay(index);
                    }
                  },
                  getTouchedSpotIndicator: (barData, spotIndexes) {
                    return spotIndexes.map((i) {
                      return TouchedSpotIndicatorData(
                        FlLine(
                          color: Color(0xFF92A3FD).withValues(alpha: 0.15),
                          strokeWidth: 40,
                        ),
                        FlDotData(show: false),
                      );
                    }).toList();
                  },
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (spots) =>
                        List.generate(spots.length, (i) => null),
                  ),
                ),
              ),
            ),

            Obx(() {
              return Positioned(
                left: _dotX(context),
                top: _dotY(context) - 30,
                child: _infoCard(),
              );
            }),
          ],
        ),
      ),
    );
  }


  Widget _infoCard() {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 15,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "62% increase",
                style: globalTextStyle(
                  fontSize: 12,
                  color: Color(0xFF4CAF50),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 3),
              Icon(
                Icons.arrow_upward,
                size: 12,
                color: Color(0xFF4CAF50),
              ),
            ],
          ),
        ],
      )
    );
  }

  double _dotX(BuildContext context) {
    double chartWidth = MediaQuery.of(context).size.width - 70;
    double unitWidth = chartWidth / 6;
    return controller.selectedDay.value * unitWidth;
  }

  double _dotY(BuildContext context) {
    double chartHeight = 220;
    double value = controller.dataPointss[controller.selectedDay.value];
    double yPos = chartHeight - (chartHeight * (value / 100));
    return yPos;
  }
}
