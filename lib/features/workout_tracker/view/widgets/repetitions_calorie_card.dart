import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RepetitionsCalorieCard extends StatelessWidget {
  const RepetitionsCalorieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: CupertinoPicker.builder(
        itemExtent: 40,
        selectionOverlay: Container(
          width: double.maxFinite,
          height: 40,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColors.gray.withValues(alpha: 0.2),
                width: 1,
              ),
              bottom: BorderSide(
                color:  AppColors.gray.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
          ),
        ),
        onSelectedItemChanged: (index) {},
        childCount: 60,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_fire_department,
                color:  Colors.red ,
                size: 24,
              ),
              SizedBox(width: 10),
              Text(
                " ${(index + 1) * 15} Calories Burn",
                style: globalTextStyle(
                  color: AppColors.gray,
                  fontSize: 15,
                ),
              ),
              SizedBox(width: 10),
              Text(
                " ${index + 1} ",
                style: globalTextStyle(
                  color:  AppColors.gray,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10),
              Text(
                " times",
                style: globalTextStyle(
                  color: AppColors.gray,
                  fontSize: 16,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}