import 'package:expandable_text/expandable_text.dart';
import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/workout_tracker/controller/exercise_details_controller.dart';
import 'package:fitnestx/features/workout_tracker/controller/workout_details_controller.dart';
import 'package:fitnestx/features/workout_tracker/model/exercise_set.dart';
import 'package:fitnestx/features/workout_tracker/view/widgets/repetitions_calorie_card.dart';
import 'package:fitnestx/features/workout_tracker/view/widgets/how_to_step_item.dart';
import 'package:fitnestx/features/workout_tracker/view/widgets/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart' as video_player;

class ExerciseDetailsScreen extends StatelessWidget {
   ExerciseDetailsScreen({super.key});

   final ExerciseDetailsController controller = Get.put(ExerciseDetailsController());

  final ExerciseModel exerciseModel = Get.arguments as ExerciseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBackButton(
                  icon: Icons.clear,
                  onTap: () {
                      controller.videoController.pause();
                      Get.delete<WorkoutDetailsController>();
                      Get.back();
                  },
                ),
                Text(
                  "Exercise Details",
                  style: globalTextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppBackButton(
                  icon: Icons.more_horiz,
                  //bgColor: Colors.white,
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Obx(() {
                        if (!controller.isInitialized.value) {
                          return SizedBox(height:200,
                              child: Center(
                                  child: const CircularProgressIndicator(),
                              ),
                          );
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: AspectRatio(
                                aspectRatio: controller.videoController.value.aspectRatio,
                                child: video_player.VideoPlayer(controller.videoController),
                              ),
                            ),
                            const SizedBox(height: 10),
                            VideoPlayerScreen(),
                          ],
                        );
                      },
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      exerciseModel.title,
                      style: globalTextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Easy | ${exerciseModel.calories}',
                      style: globalTextStyle(
                        color: AppColors.gray,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Descriptions",
                      style: globalTextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 3),
                    ExpandableText(
                      exerciseModel.descriptions,
                      maxLines: 3,
                      expandText: 'Read more',
                      collapseText: 'Read less',
                      linkColor: AppColors.primaryColor1,
                      style: globalTextStyle(
                        color: AppColors.gray,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "How To Do It",
                          style: globalTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "4 steps",
                          style: globalTextStyle(
                            fontSize: 14,
                            color: AppColors.gray,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Obx(() {
                      return Column(
                        children: List.generate(
                          controller.stepsDataList.length,
                              (index) => HowToStepItem(
                            step: controller.stepsDataList[index],
                            isLast: index == controller.stepsDataList.length - 1,
                          ),
                        ),
                      );
                    },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Custom Repetitions",
                      style: globalTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 20),
                    RepetitionsCalorieCard(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20,top: 10),
                      child: AppPrimaryButton(
                        text: "Save",
                        textColor: Colors.white,
                        onTap: () {
                          controller.videoController.pause();
                          Get.delete<WorkoutDetailsController>();
                          Get.toNamed(AppRoutes.workoutSchedule);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


