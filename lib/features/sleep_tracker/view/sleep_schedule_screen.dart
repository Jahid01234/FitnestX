import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/global_widgets/floating_action_button_widget.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/sleep_tracker/controller/sleep_tracker_controller.dart';
import 'package:fitnestx/features/sleep_tracker/view/widgets/custom_sleep_calendar_title_bar.dart';
import 'package:fitnestx/features/sleep_tracker/view/widgets/ideal_sleep_card.dart';
import 'package:fitnestx/features/sleep_tracker/view/widgets/sleep_reminder_card.dart';
import 'package:fitnestx/features/sleep_tracker/view/widgets/sleep_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SleepScheduleScreen extends StatelessWidget {
  SleepScheduleScreen({super.key});

  final SleepTrackerController controller = Get.put(SleepTrackerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButtonWidget(
          onPressed: () {
            Get.toNamed(AppRoutes.addAlarm);
          },
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBackButton(),
                  Text(
                    "Sleep Schedule",
                    style: globalTextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppBackButton(icon: Icons.more_horiz, onTap: () {}),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IdealSleepCard(),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Your Schedule",
                        style: globalTextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    CustomSleepCalendarTitleBar(controller: controller),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Obx(
                        () => ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.remindersList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: SleepReminderCard(
                                index: index,
                                controller: controller,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SleepSummaryCard(),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
