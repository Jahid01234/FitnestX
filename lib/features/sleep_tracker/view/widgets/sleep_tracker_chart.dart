import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/sleep_tracker/controller/sleep_tracker_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SleepTrackerChart extends StatelessWidget {
  final SleepTrackerController controller;

  const SleepTrackerChart({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          LineChart(
            LineChartData(
              minY: -0.5,
              maxY: 10,
              borderData: FlBorderData(show: false),
              lineTouchData: LineTouchData(
                enabled: true,
                touchCallback: (FlTouchEvent event,
                    LineTouchResponse? touchResponse) {
                  if (event is FlTapUpEvent &&
                      touchResponse != null &&
                      touchResponse.lineBarSpots != null) {
                    final spot = touchResponse.lineBarSpots!.first;
                    controller.selectDay(spot.x.toInt());
                  }
                },
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (touchedSpot) => Colors.transparent,
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 2,
                getDrawingHorizontalLine: (_) =>
                    FlLine(color: Colors.grey.shade200, strokeWidth: 1),
              ),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 35,
                    interval: 2,
                    getTitlesWidget: (value, meta) {
                      if (value == 0 ||
                          value == 2 ||
                          value == 4 ||
                          value == 6 ||
                          value == 8 ||
                          value == 10) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            '${value.toInt()}h',
                            style: globalTextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 35,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();

                      if (index < 0 || index >= controller.days.length) {
                        return const SizedBox();
                      }

                      return Obx(() {
                        final isSelected =
                            controller.selectedDayIndex.value == index;

                        return GestureDetector(
                          onTap: () {
                            controller.selectDay(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              controller.days[index],
                              style: globalTextStyle(
                                fontSize: 12,
                                color: isSelected
                                    ? const Color(0xFF7B6CF6)
                                    : Colors.grey.shade500,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    const FlSpot(0, 2),
                    const FlSpot(1, 4.5),
                    const FlSpot(2, 3.4),
                    const FlSpot(3, 6.3),
                    const FlSpot(4, 4.5),
                    const FlSpot(5, 5.5),
                    const FlSpot(6, 8),
                  ],
                  isCurved: true,
                  curveSmoothness: 0.4,
                  color: const Color(0xFF92A3FD),
                  barWidth: 3,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF92A3FD).withValues(alpha: 0.4),
                        const Color(0xFF92A3FD).withValues(alpha: 0.1),
                        const Color(0xFF92A3FD).withValues(alpha: 0.05),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 43% increase label
          Positioned(
            top: 30,
            right: 80,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                '43% increase',
                style: globalTextStyle(
                  fontSize: 11,
                  color: const Color(0xFF7FD97F),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.53,
            top: 0,
            bottom: 40,
            child: DottedDashedLine(
              height: 0,
              width: 1,
              axis: Axis.vertical,
              dashColor: AppColors.primaryColor1,
            ),
          ),
        ],
      ),
    );
  }
}

