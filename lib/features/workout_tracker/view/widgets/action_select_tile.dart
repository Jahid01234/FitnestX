import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class ActionSelectTile extends StatelessWidget {
  final String image;
  final String title;
  final String value;
  final VoidCallback onTap;
  final Color bgColor;

  const ActionSelectTile({
    super.key,
    required this.image,
    required this.title,
    required this.value,
    required this.onTap,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(image, height: 22, width: 22),
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: globalTextStyle(
                fontSize: 14,
                color: AppColors.gray,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: globalTextStyle(
                fontSize: 12,
                color: AppColors.gray,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.chevron_right, size: 30, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
