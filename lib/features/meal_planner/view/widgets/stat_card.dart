import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final double left;
  final double top;
  final String title;
  final String value;
  final bool isUp;

  const StatCard({
    super.key,
    required this.left,
    required this.top,
    required this.title,
    required this.value,
    required this.isUp,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.08),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: globalTextStyle(fontSize: 12),
                ),
                const SizedBox(width: 6),
                Text(
                  value,
                  style: globalTextStyle(
                    fontSize: 12,
                    color: isUp ? Colors.green : Colors.red,
                  ),
                ),
                Icon(
                  isUp ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 14,
                  color: isUp ? Colors.green : Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: double.parse(value.replaceAll('%', '')) / 100,
                minHeight: 6,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation(
                    AppColors.primaryColor1
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
