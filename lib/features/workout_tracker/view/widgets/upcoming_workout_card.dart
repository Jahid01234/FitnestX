import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/workout_tracker/controller/workout_tracker_controller.dart';
import 'package:fitnestx/features/workout_tracker/model/upcoming_workout_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingWorkoutCard extends StatelessWidget {
  final UpcomingWorkoutModel workoutModel;
  final int index;

  UpcomingWorkoutCard({
    super.key,
    required this.workoutModel,
    required this.index,
  });

  final WorkoutTrackerController controller =
  Get.find<WorkoutTrackerController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Image.asset(workoutModel.image),
            ),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workoutModel.title,
                  style: globalTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  workoutModel.time,
                  style: globalTextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),
          Obx(() => Switch(
            value: controller.upcomingWorkoutList[index].active,
            activeColor: AppColors.primaryColor2,
            onChanged: (value) {
              controller.toggleWorkout(index, value);
            },
          )),
        ],
      ),
    );
  }
}
