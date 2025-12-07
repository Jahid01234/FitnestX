import 'package:flutter/material.dart';
import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';

class SuccessDialog extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final String buttonText;
  final VoidCallback onTap;

  const SuccessDialog({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: getHeight(200)),
            Image.asset(image, height: 200, fit: BoxFit.cover),
            SizedBox(height: getHeight(70)),
            Center(
              child: Column(
                children: [
                  Text(
                    title,
                    style: globalTextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: getHeight(5)),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: globalTextStyle(
                      color: AppColors.gray,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getHeight(220)),
            AppPrimaryButton(
              text: buttonText,
              textColor: AppColors.white,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
