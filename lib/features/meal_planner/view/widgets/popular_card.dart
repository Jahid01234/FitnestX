import 'package:fitnestx/features/meal_planner/model/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/style/global_text_style.dart';


class PopularCard extends StatelessWidget {
  final PopularModel model;
  final VoidCallback? onTap;

  const PopularCard({
    super.key,
    required this.model,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(4, -4),
            ),
          ],
        ),
        child: Row(
          children: [
             Image.asset(
                model.image,
                fit: BoxFit.cover,
                height: 45,
                width: 45,
              ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: globalTextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${model.dietType} | ${model.duration} | ${model.calories}",
                    style: globalTextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.secondaryColor1,width: 1)
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: AppColors.secondaryColor1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
