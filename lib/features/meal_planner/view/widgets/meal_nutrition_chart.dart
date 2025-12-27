import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/meal_planner/controller/meal_planner_controller.dart';
import 'package:fitnestx/features/meal_planner/view/widgets/stat_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MealNutritionChart extends StatelessWidget {
  final MealPlannerController controller;

  const MealNutritionChart({
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
            LineChart(
              LineChartData(
                minY: -0.5,
                maxY: 100,
                borderData: FlBorderData(show: false),
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchCallback: (FlTouchEvent event,
                      LineTouchResponse? touchResponse) {
                    if (event is FlTapUpEvent && touchResponse != null &&
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
                  horizontalInterval: 20,
                  getDrawingHorizontalLine: (_) =>
                      FlLine(color: Colors.grey.shade200),
                ),

                titlesData: FlTitlesData(
                  topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(
                            '${value.toInt()}%',
                            style: globalTextStyle(
                              fontSize: 10,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
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
                                      ? Colors.purple.shade300
                                      : Colors.grey.shade600,
                                  fontWeight:
                                  isSelected ? FontWeight.w600 : FontWeight
                                      .normal,
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
                    spots: List.generate(
                      controller.chartData.length,
                          (index) =>
                          FlSpot(
                            index.toDouble(),
                            controller.chartData[index],
                          ),
                    ),
                    isCurved: true,
                    color: Colors.blue.shade300,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: Colors.white,
                          strokeWidth: 2,
                          strokeColor: Colors.blue.shade300,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
            _fixedStatCards(),
          ],
        ),
      ),
    );
  }


  /// ================= FIXED STAT CARDS =================
  Widget _fixedStatCards() {
    return Stack(
      clipBehavior: Clip.none,
      children: const [
        StatCard(
          left: 30,
          top: 26,
          title: 'Calories',
          value: '82%',
          isUp: true,
        ),
        StatCard(
          left: 160,
          top: -10,
          title: 'Fibre',
          value: '88%',
          isUp: true,
        ),
        StatCard(
          left: 0,
          top: 138,
          title: 'Sugar',
          value: '39%',
          isUp: false,
        ),
        StatCard(
          left: 146,
          top: 126,
          title: 'Fats',
          value: '42%',
          isUp: false,
        ),
      ],
    );
  }
}

