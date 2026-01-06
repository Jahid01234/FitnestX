import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/workout_tracker/model/train_option_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainOptionCard extends StatelessWidget {
  final TrainOptionModel trainOptionModel;

  const TrainOptionCard({super.key, required this.trainOptionModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor2.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trainOptionModel.title,
                  style: globalTextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${trainOptionModel.exercises} | ${trainOptionModel.duration}',
                  style: globalTextStyle(
                    color: AppColors.gray,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 15),
                AppPrimaryButton(
                  height: 45,
                  width: 120,
                  text: "View more",
                  fontSize: 14,
                  bgColor: AppColors.white,
                  textColor: AppColors.primaryColor1,
                  fontWeight: FontWeight.w400,
                  onTap: () {
                    Get.toNamed(
                        AppRoutes.workoutDetails,
                        arguments: trainOptionModel,
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 92,
            width: 92,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(trainOptionModel.image, fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }
}
