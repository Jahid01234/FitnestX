import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/meal_planner/model/ingredients_model.dart';
import 'package:flutter/material.dart';


class IngredientsCard extends StatelessWidget {
  final IngredientsModel model;

  const IngredientsCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Color(0xFF92A3FD).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(13)
            ),
            child: Center(
              child: Image.asset(
                    model.image,
                    height: 46,
                    width: 41,
                  ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            model.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: globalTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            model.quantity,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: globalTextStyle(
              fontSize: 13,
              color: AppColors.gray,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
