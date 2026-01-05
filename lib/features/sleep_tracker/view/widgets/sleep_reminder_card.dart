import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/sleep_tracker/controller/sleep_tracker_controller.dart';
import 'package:flutter/material.dart';



class SleepReminderCard extends StatelessWidget {
  final int index;
  final SleepTrackerController controller;

  const SleepReminderCard({
    super.key,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final reminder = controller.remindersList[index];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(left:15 ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            reminder.iconPath,
            height: 35,
            width: 35,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      reminder.title,
                      style: globalTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      reminder.time,
                      style: globalTextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  reminder.subtitle,
                  style: globalTextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),

          // Switch
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
              Transform.scale(
                scale: 0.75,
                child: Switch(
                  value: reminder.isEnabled,
                  activeThumbColor: Colors.purple,
                  onChanged: (value) {
                    controller.toggleReminder(index, value);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
