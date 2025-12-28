import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/meal_planner/model/recommendation_diet_model.dart';
import 'package:flutter/material.dart';


class RecommendationDietCard extends StatelessWidget {
  final RecommendationDietModel model;
  final int index;
 

  const RecommendationDietCard({
    super.key,
    required this.model,
    required this.index,
  });

  Color _getColorByIndex(int index) {
    List<Color> colors = [
      const Color(0xFF92A3FD).withValues(alpha: 0.2),
      const Color(0xFFC58BF2).withValues(alpha: 0.2),
      const Color(0xFFEEA4CE).withValues(alpha: 0.2),
      const Color(0xFF9DCEFF).withValues(alpha: 0.2),
    ];

    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _getColorByIndex(index),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset(model.image, height: 80, width: 116),
            const SizedBox(height: 10),
            Text(
              model.title,
              style: globalTextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "${model.dietType} | ${model.duration} | ${model.calories}",
              style: globalTextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
            AppPrimaryButton(
                weight: 120,
                height: 43,
                text: "View",
                fontSize: 14,
                textColor: Colors.white,
                onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}
