import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/progress_tracker/model/goal_progress_model.dart';
import 'package:fitnestx/features/progress_tracker/view/widgets/goal_progress_bar.dart';
import 'package:flutter/material.dart';


class GoalProgressCard extends StatelessWidget {
  final GoalProgressModel model;

  const GoalProgressCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            model.title,
            style: globalTextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          GoalProgressBar(
            left: model.leftPercent,
            right: model.rightPercent,
          ),
        ],
      ),
    );
  }
}

