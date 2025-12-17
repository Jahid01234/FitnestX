import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/global_widgets/activities_action_card.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/workout_tracker/controller/workout_tracker_controller.dart';
import 'package:fitnestx/features/workout_tracker/view/widgets/train_option_card.dart';
import 'package:fitnestx/features/workout_tracker/view/widgets/upcoming_workout_card.dart';
import 'package:fitnestx/features/workout_tracker/view/widgets/workout_tracker_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutTrackerScreen extends StatelessWidget {
  WorkoutTrackerScreen({super.key});

  final WorkoutTrackerController controller = Get.put(
    WorkoutTrackerController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(color: AppColors.primaryColor2),
          ),

          // Header content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(opacity: 0, child: AppBackButton()),
                      Text(
                        "Workout Tracker",
                        style: globalTextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      AppBackButton(
                        icon: Icons.more_horiz,
                        bgColor: Colors.white,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Chart
                  SizedBox(height: 260, child: WorkoutTrackerChart()),
                ],
              ),
            ),
          ),

          // Draggable bottom sheet
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.4,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Drag handle
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: getHeight(10)),
                              ActivitiesActionCard(
                                title: "Daily Workout Schedule",
                                buttonText: "Check",
                                gradientColors: [
                                  Colors.blue.shade50,
                                  Colors.blue.shade50,
                                ],
                                onTap: () {},
                              ),
                              SizedBox(height: getHeight(40)),
                              // Upcoming workout section...........
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Upcoming Workout',
                                    style: globalTextStyle(
                                      fontSize: 18,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'See more',
                                      style: globalTextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Obx(
                                () => ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.upcomingWorkoutList.length,
                                  itemBuilder: (context, index) {
                                    return UpcomingWorkoutCard(
                                      workoutModel: controller.upcomingWorkoutList[index],
                                      index: index,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                'What Do You Want to Train',
                                style: globalTextStyle(
                                  fontSize: 18,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10),
                              Obx(
                                    () => ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.trainOptionList.length,
                                  itemBuilder: (context, index) {
                                    return TrainOptionCard(
                                      trainOptionModel: controller.trainOptionList[index],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
