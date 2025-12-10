import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/home/controller/home_controller.dart';
import 'package:fitnestx/features/home/view/widgets/workouts_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeMoreLatestWorkoutScreen extends StatelessWidget {
  SeeMoreLatestWorkoutScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  AppBackButton(),
                  const SizedBox(width: 15),
                  Text(
                    "Latest Workouts",
                    style: globalTextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              SizedBox(height: getHeight(40)),

              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.workoutsDataList.length,
                  itemBuilder: (context, index) {
                    return WorkoutCard(
                      workout: controller.workoutsDataList[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
