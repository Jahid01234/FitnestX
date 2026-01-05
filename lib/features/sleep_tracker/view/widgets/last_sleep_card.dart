import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/images_path.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class LastSleepCard extends StatelessWidget {
  const LastSleepCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 15),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor1,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 20),
              child: Text(
                'Last Night Sleep\n 8h 20m',
                textAlign: TextAlign.start,
                style: globalTextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20),
            Image.asset(ImagePath.sleepGraph2)
          ],
        ),
      ),
    );
  }
}
