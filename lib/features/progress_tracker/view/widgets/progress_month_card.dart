import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/images_path.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class ProgressMonthCard extends StatelessWidget {
  const ProgressMonthCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( right: 15),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColors.primaryColor1.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Track Your Progress\n Each Month With Photo',
                  textAlign: TextAlign.start,
                  style: globalTextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                AppPrimaryButton(
                  height: 38,
                  width: 130,
                  text: "Learn More",
                  fontSize: 14,
                  textColor: Colors.white,
                  onTap: (){},

                )
              ],
            ),
            SizedBox(width: 10),
            Image.asset(ImagePath.calender,height: 100,width: 118,)
          ],
        ),
      ),
    );
  }
}
