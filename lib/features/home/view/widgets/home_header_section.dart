import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/icons_path.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back,",
              style: globalTextStyle(
                color: AppColors.gray,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            Text(
              "Stefani Wong",
              style: globalTextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
          ],
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.withValues(alpha: 0.1),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(IconsPath.notification),
          ),
        ),
      ],
    );
  }
}
