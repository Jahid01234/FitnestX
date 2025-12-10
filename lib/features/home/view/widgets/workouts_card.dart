import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/home/model/workout_model.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutModel workout;

  const WorkoutCard({
    super.key,
    required this.workout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Image.asset(workout.image),
            ),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workout.title,
                  style: globalTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${workout.calories} | ${workout.duration}",
                  style: globalTextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 10),

                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: LinearProgressIndicator(
                    value: workout.progress,
                    minHeight: 6,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation(Colors.purple.shade300),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.purple),
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
