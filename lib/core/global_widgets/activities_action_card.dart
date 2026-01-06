import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class ActivitiesActionCard extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onTap;
  final List<Color> gradientColors;
  final double borderRadius;

  const ActivitiesActionCard({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onTap,
    required this.gradientColors,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: globalTextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          AppPrimaryButton(
            text: buttonText,
            fontSize: 14,
            bgColor: const Color(0xFFD4B5E8),
            height: 40,
            width: 100,
            textColor: AppColors.white,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
