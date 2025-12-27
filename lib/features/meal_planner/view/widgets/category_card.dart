import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/meal_planner/model/category_model.dart';
import 'package:flutter/material.dart';


class CategoryCard extends StatelessWidget {
  final CategoryModel model;
  final int index;


  const CategoryCard({
    super.key,
    required this.model,
    required this.index
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
      height: 100,
      width: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _getColorByIndex(index),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Container(
             height: 50,
               width: 50,
               padding: EdgeInsets.all(6),
               decoration: BoxDecoration(
                   color: Colors.white,
                   shape: BoxShape.circle,
               ),
               child: Image.asset(
                   model.image,
                   height: 26,
                   width: 26,
               ),
           ),
          const SizedBox(height: 20),
          Text(
            model.title,
            style: globalTextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
