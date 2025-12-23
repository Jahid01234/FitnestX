import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/meal_planner/controller/meal_planner_controller.dart';
import 'package:fitnestx/features/meal_planner/model/meal_option_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealOptionCard extends StatelessWidget {
  final MealOptionModel model;
  final MealPlannerController controller;

  const MealOptionCard({
    super.key,
    required this.model,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: model.bgColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(130),
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(model.image, height: 74, width: 118),
          ),
          const SizedBox(height: 20),
          Text(
            model.title,
            style: globalTextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),
          Text(
            model.foodCount,
            style: globalTextStyle(fontSize: 13, color: Colors.grey),
          ),

          const SizedBox(height: 16),
          Obx(
            () => GestureDetector(
              onTap: () => controller.selectMeal(model.title),
              child: Container(
                margin: const EdgeInsets.only(right: 40),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: model.buttonColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    controller.selectedMeal.value == model.title
                        ? "Selected"
                        : "Select",
                    style: globalTextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
