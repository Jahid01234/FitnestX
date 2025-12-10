import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/images_path.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/home/view/widgets/today_target_item.dart';
import 'package:flutter/material.dart';

class TodayTargetCard extends StatelessWidget {
  const TodayTargetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor2.withValues(alpha: 0.15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today Target",
                  style: globalTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppPrimaryButton(
                  text: "+",
                  fontSize: 20,
                  bgColor: AppColors.primaryColor1,
                  height: 30,
                  weight: 30,
                  radius: 10,
                  textColor: AppColors.white,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TodayTargetItem(
                  imagePath: ImagePath.glass,
                  title: "8L",
                  subtitle: "Water Intake",
                ),
                TodayTargetItem(
                  imagePath: ImagePath.boots,
                  title: "2400",
                  subtitle: "Foot Steps",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

