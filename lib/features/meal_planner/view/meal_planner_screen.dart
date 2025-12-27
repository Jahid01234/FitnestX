import 'package:fitnestx/core/global_widgets/activities_action_card.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/global_widgets/header_selection_widget.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/meal_planner/controller/meal_planner_controller.dart';
import 'package:fitnestx/features/meal_planner/view/widgets/meal_nutrition_chart.dart';
import 'package:fitnestx/features/meal_planner/view/widgets/meal_option_card.dart';
import 'package:fitnestx/features/meal_planner/view/widgets/meals_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealPlannerScreen extends StatelessWidget {
  MealPlannerScreen({super.key});

  final MealPlannerController controller = Get.put(MealPlannerController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 50,left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBackButton(),
                    Text(
                      "Meal Planner",
                      style: globalTextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppBackButton(
                      icon: Icons.more_horiz,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: HeaderSelectionWidget(
                          title: "Meal Nutritions",
                          selectedValue: controller.period,
                          onTap: controller.changePeriod,
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: MealNutritionChart(controller: controller),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: ActivitiesActionCard(
                          title: "Daily Meal Schedule",
                          buttonText: "Check",
                          gradientColors: [
                            Colors.blue.shade50,
                            Colors.blue.shade50,
                          ],
                          onTap: () {},
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: HeaderSelectionWidget(
                          title: "Today Meals",
                          selectedValue: controller.mealTiming,
                          onTap: controller.toggleMealTiming,
                        ),
                      ),
                      SizedBox(height: 30),
                      Obx(() => ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.mealsList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: MealsCard(
                                controller: controller,
                                mealsModel: controller.mealsList[index],
                                index: index,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Find Something to Eat",
                        style: globalTextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Obx(() => SizedBox(
                        height: 240,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemCount: controller.mealOptionList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: GestureDetector(
                                onTap: (){
                                  Get.toNamed(AppRoutes.breakFast);
                                },
                                child: MealOptionCard(
                                  controller: controller,
                                  model: controller.mealOptionList[index],
                                ),
                              ),
                            );
                          },
                         ),
                        ),
                      ),
                      SizedBox(height: 30),
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
