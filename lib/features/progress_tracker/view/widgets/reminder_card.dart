import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/images_path.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class ReminderCard extends StatelessWidget {
  const ReminderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
            decoration: BoxDecoration(
              color: Colors.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(ImagePath.alarmClock),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reminder!',
                      style: globalTextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Next Photos Fall On July 08',
                      style: globalTextStyle(
                        fontSize: 15,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 5,
            child: IconButton(
              icon: const Icon(Icons.clear, size: 20),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
