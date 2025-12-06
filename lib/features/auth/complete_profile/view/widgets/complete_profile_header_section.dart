import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/const/images_path.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class CompleteProfileHeaderSection extends StatelessWidget {
  const CompleteProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImagePath.weightGain,
          height: getHeight(350),
        ),
        SizedBox(height: getHeight(30)),
        Text(
          "Let's complete your profile",
          style: globalTextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        SizedBox(height: getHeight(5)),
        Text(
          "It will help us to know more about you!",
          style: globalTextStyle(
            color: AppColors.gray,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
