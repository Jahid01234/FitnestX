import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/meal_planner/controller/meal_planner_controller.dart';
import 'package:fitnestx/features/meal_planner/model/meals_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealsCard extends StatelessWidget {
  final MealPlannerController controller;
  final MealsModel mealsModel;
  final int index;

  const MealsCard({
    super.key,
    required this.controller,
    required this.mealsModel,
    required this.index,
  });




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
           Padding(
              padding: const EdgeInsets.all(6),
              child: Image.asset(mealsModel.image,height: 30,width: 30,),
            ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mealsModel.title,
                  style: globalTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  mealsModel.time,
                  style: globalTextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),
          Obx(() => IconButton(
            onPressed: () {
              controller.toggleMealList(
                index,
                !controller.mealsList[index].active,
              );
            },
            icon: Icon(
              controller.mealsList[index].active
                  ? Icons.notifications_active
                  : Icons.notifications_off_outlined,
              color: controller.mealsList[index].active
                  ? AppColors.primaryColor2
                  : Colors.grey.shade400,
              size: 24,
             ),
            ),
          ),
        ],
      ),
    );
  }
}
