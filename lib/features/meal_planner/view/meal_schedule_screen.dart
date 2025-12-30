import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/global_widgets/floating_action_button_widget.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/meal_planner/controller/meal_schedule_controller.dart';
import 'package:fitnestx/features/meal_planner/view/widgets/custom_calendar_title_bar.dart';
import 'package:fitnestx/features/meal_planner/view/widgets/meal_nutrition_card.dart';
import 'package:fitnestx/features/meal_planner/view/widgets/meal_section_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealScheduleScreen extends StatelessWidget {
  MealScheduleScreen({super.key});

  final MealScheduleController controller = Get.put(MealScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButtonWidget(onPressed: () {}),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBackButton(),
                  Text(
                    "Meal Schedule",
                    style: globalTextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppBackButton(icon: Icons.more_horiz, onTap: () {}),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCalendarTitleBar(controller: controller),
                    const SizedBox(height: 30),
                    Obx(() {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.mealSectionDataList.length,
                        itemBuilder: (context, setIndex) {
                          final meal = controller.mealSectionDataList[setIndex];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      meal.sectionTitle,
                                      style: globalTextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    Text(
                                      "${meal.totalMeals} | ${meal.totalCalories} ",
                                      style: globalTextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.gray,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: meal.items.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return MealSectionCard(
                                      model: meal.items[index],
                                      onTap: () {},
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Today Meal Nutritions",
                        style: globalTextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Obx(
                      () => ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.mealNutritionList.length,
                        itemBuilder: (context, index) {
                          return MealNutritionCard(
                            model: controller.mealNutritionList[index],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 70),
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
