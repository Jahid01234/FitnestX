import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/const/icons_path.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/workout_tracker/controller/workout_details_controller.dart';
import 'package:fitnestx/features/workout_tracker/model/train_option_model.dart';
import 'package:fitnestx/features/workout_tracker/view/widgets/action_select_tile.dart';
import 'package:fitnestx/features/workout_tracker/view/widgets/equipment_card.dart';
import 'package:fitnestx/features/workout_tracker/view/widgets/exercise_set_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  WorkoutDetailsScreen({super.key});

  final WorkoutDetailsController controller = Get.put(
    WorkoutDetailsController(),
  );

  final TrainOptionModel trainOption = Get.arguments as TrainOptionModel;

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
                      AppBackButton(bgColor: Colors.white),
                      Text(
                        "Workout Details",
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
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 380,
                      width: 380,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(trainOption.image, fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Draggable bottom sheet
          DraggableScrollableSheet(
            initialChildSize: 0.55,
            minChildSize: 0.55,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: getHeight(10)),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          trainOption.title,
                                          style: globalTextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          '${trainOption.exercises} | ${trainOption.duration} | ${trainOption.calories}',
                                          style: globalTextStyle(
                                            color: AppColors.gray,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Obx(
                                    () => IconButton(
                                      onPressed: controller.toggleFavorite,
                                      icon: Icon(
                                        controller.isFavorite.value
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: controller.isFavorite.value
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Column(
                                children: [
                                  Obx(
                                    () => ActionSelectTile(
                                      image: IconsPath.calendar,
                                      title: 'Schedule Workout',
                                      value: controller.formattedDate,
                                      bgColor: Colors.blue.shade50,
                                      onTap: () => controller.pickDate(context),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Obx(
                                    () => ActionSelectTile(
                                      image: IconsPath.height,
                                      title: 'Difficulty',
                                      value: controller.difficulty.value,
                                      bgColor: Colors.purple.shade50,
                                      onTap: controller.showDifficultySheet,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'You’ll Need',
                                    style: globalTextStyle(
                                      fontSize: 18,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '5 Items',
                                    style: globalTextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12),
                            SizedBox(
                              height: 185,
                              child: Obx(
                                () => ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      controller.equipmentDataList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10,
                                        left: 15,
                                      ),
                                      child: EquipmentCard(
                                        equipmentModel:
                                            controller.equipmentDataList[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Exercises',
                                    style: globalTextStyle(
                                      fontSize: 18,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '3 Sets',
                                    style: globalTextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Obx(() {
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    controller.exerciseSetDataList.length,
                                itemBuilder: (context, setIndex) {
                                  final set =
                                      controller.exerciseSetDataList[setIndex];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          set.setName,
                                          style: globalTextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: set.exercises.length,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return ExerciseSetCard(
                                              exercise: set.exercises[index],
                                              onTap: () {
                                                Get.toNamed(
                                                    AppRoutes.exerciseDetails,
                                                    arguments: set.exercises[index],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                             },
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                15,
                                10,
                                15,
                                20,
                              ),
                              child: AppPrimaryButton(
                                text: "Start Workout",
                                textColor: Colors.white,
                                onTap: () {},
                              ),
                            ),
                          ],
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
