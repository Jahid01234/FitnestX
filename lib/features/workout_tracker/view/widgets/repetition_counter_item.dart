import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class RepetitionCounterItem extends StatelessWidget {
  final int value;
  final bool isSelected;

  const RepetitionCounterItem({
    super.key,
    required this.value,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value.toString(),
      style: globalTextStyle(
        fontSize: isSelected ? 28 : 18,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        color: isSelected ? AppColors.black : AppColors.gray,
      ),
    );
  }
}
