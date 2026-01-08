import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class GoalProgressBar extends StatelessWidget {
  final int left;
  final int right;

  const GoalProgressBar({
    super.key,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$left%",
          style: globalTextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Row(
              children: [
                Expanded(
                  flex: left,
                  child: Container(
                    height: 10,
                    color: Colors.redAccent.withValues(alpha: 0.6),
                  ),
                ),
                Expanded(
                  flex: right,
                  child: Container(
                    height: 10,
                    color: Colors.blueAccent.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          "$right%",
          style: globalTextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}