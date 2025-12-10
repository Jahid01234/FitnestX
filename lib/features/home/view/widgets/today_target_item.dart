import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class TodayTargetItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;


  const TodayTargetItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.white,
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 40,
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: globalTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor2,
                ),
              ),
              Text(
                subtitle,
                style: globalTextStyle(
                  fontSize: 13,
                  color: AppColors.gray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
