import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/global_widgets/custom_text_field.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class MeasurementField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String iconPath;
  final String unit;
  final VoidCallback onUnitTap;

  const MeasurementField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.iconPath,
    required this.unit,
    required this.onUnitTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: controller,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(iconPath, height: 10),
            ),
            hinText: hintText,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onUnitTap,
          child: Container(
            width: 57,
            height: 57,
            decoration: BoxDecoration(
              gradient: AppColors.appGradient2,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                unit,
                style: globalTextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}