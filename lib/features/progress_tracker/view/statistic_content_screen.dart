import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/progress_tracker/controller/compare_result_controller.dart';
import 'package:fitnestx/features/progress_tracker/view/widgets/goal_progress_card.dart';
import 'package:fitnestx/features/progress_tracker/view/widgets/statistic_tracker_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticContentScreen extends StatelessWidget {
  final CompareResultController controller;

  const StatisticContentScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          StatisticTrackerChart(controller: controller),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "May",
                style: globalTextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "June",
                style: globalTextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Obx(
            () => Column(
              children: controller.goalProgressList
                  .map((goal) => GoalProgressCard(model: goal))
                  .toList(),
            ),
          ),
          const SizedBox(height: 30),
          AppPrimaryButton(
            text: "Back to home",
            textColor: Colors.white,
            onTap: () {
              Get.back();
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
