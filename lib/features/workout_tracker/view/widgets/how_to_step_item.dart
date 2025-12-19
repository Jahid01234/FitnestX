import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/workout_tracker/model/how_to_step_model.dart';
import 'package:flutter/material.dart';

class HowToStepItem extends StatelessWidget {
  final HowToStepModel step;
  final bool isLast;

  const HowToStepItem({
    super.key,
    required this.step,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 30,
          child: Text(
            step.stepNo,
            textAlign: TextAlign.center,
            style: globalTextStyle(
              color: AppColors.secondaryColor1,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 6),
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.secondaryColor2,
                  width: 2,
                ),
              ),
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor2,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            if (!isLast)
              DottedDashedLine(
                height: 90,
                width: 2,
                axis: Axis.vertical,
                dashColor: AppColors.secondaryColor2,
                dashSpace: 4,
                dashWidth: 2,
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                step.title,
                style: globalTextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                step.description,
                style: globalTextStyle(
                  fontSize: 14,
                  color: AppColors.gray,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
