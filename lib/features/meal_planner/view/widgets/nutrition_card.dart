import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/meal_planner/model/nutrition_model.dart';
import 'package:flutter/material.dart';


class NutritionCard extends StatelessWidget {
  final NutritionModel model;

  const NutritionCard({
    super.key,
    required this.model,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Color(0xFF92A3FD).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(13)
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              model.image,
              height: 18,
              width: 18,
            ),
            const SizedBox(width: 5),
            Text(
              model.calories,
              style: globalTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
