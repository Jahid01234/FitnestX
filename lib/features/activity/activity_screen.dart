import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppPrimaryButton(
                  text: "Workout Tracker",
                  textColor: Colors.white,
                  onTap: () {
                    Get.toNamed(AppRoutes.workoutTracker);
                  },
                ),
                SizedBox(height: 20),
                AppPrimaryButton(
                  text: "Meal Planner",
                  textColor: Colors.white,
                  onTap: () {
                    Get.toNamed(AppRoutes.mealPlanner);
                  },
                ),
                SizedBox(height: 20),
                AppPrimaryButton(
                  text: "Sleep Tracker",
                  textColor: Colors.white,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
