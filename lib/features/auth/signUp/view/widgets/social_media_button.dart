import 'package:fitnestx/core/const/app_colors.dart';
import 'package:flutter/material.dart';


class SocialMediaButton extends StatelessWidget {
  final String image;
  final VoidCallback onTap;


  const SocialMediaButton({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.gray.withValues(alpha: 0.5),
            width: 1
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(image),
        ),
      ),
    );
  }
}