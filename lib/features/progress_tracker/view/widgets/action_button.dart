import 'package:fitnestx/core/const/app_colors.dart';
import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  final IconData icon;
  final bool isCenter;
  final VoidCallback onTap;

  const ActionButtonWidget({
    super.key,
    required this.icon,
    this.isCenter = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isCenter ? 56 : 40,
        height: isCenter ? 56 : 40,
        decoration: BoxDecoration(
          color: isCenter ? AppColors.secondaryColor1 : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isCenter ? Colors.white : Colors.grey[600],
          size: isCenter ? 28 : 24,
        ),
      ),
    );
  }
}
