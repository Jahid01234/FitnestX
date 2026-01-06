import 'package:fitnestx/core/const/icons_path.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/features/sleep_tracker/controller/add_alarm_controller.dart';
import 'package:fitnestx/features/sleep_tracker/view/widgets/add_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitnestx/core/style/global_text_style.dart';


class AddAlarmScreen extends StatelessWidget {
  AddAlarmScreen({super.key});

  final AddAlarmController controller = Get.put(AddAlarmController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // -------- App Bar ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppBackButton(),
                  Text(
                    "Add Alarm",
                    style: globalTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff1D1617),
                    ),
                  ),
                  AppBackButton(icon: Icons.more_horiz, onTap: () {}),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => AddOptionTile(
                        icon: IconsPath.beds,
                        title: 'Bedtime',
                        subtitle: controller.formattedBedtime,
                        onTap: () => pickBedtime(context),
                      ),
                    ),
        
                    const SizedBox(height: 12),
                    Obx(
                      () => AddOptionTile(
                        icon: IconsPath.clock,
                        title: 'Hours of sleep',
                        subtitle: controller.formattedSleepHours,
                        onTap: () => pickSleepDuration(context),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Obx(
                      () => AddOptionTile(
                        icon: IconsPath.repeat,
                        title: 'Repeat',
                        subtitle: controller.formattedRepeat,
                        onTap: () => pickRepeatDays(context),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.only(left: 16,right: 16,top: 5,bottom: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xffF7F8F8),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Image.asset(IconsPath.vibrate, height: 24),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "vibrate When Alarm Sound",
                              style: globalTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                           Obx(()=>
                             Switch(
                                value: controller.reminder.value,
                                activeThumbColor: Colors.purple,
                                onChanged: (value) {
                                  controller.toggleReminder(value);
                                },
                             ),
                           ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
        
            // Save Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: AppPrimaryButton(
                text: "Save",
                textColor: Colors.white,
                onTap: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }






  // Time Picker Methods..........................
  Future<void> pickBedtime(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(controller.bedtime.value),
    );

    if (time != null) {
      final now = DateTime.now();
      controller.bedtime.value = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );
    }
  }


  // Sleep Picker Methods..........................
  void pickSleepDuration(BuildContext context) {
    controller.tempHour.value = controller.sleepMinutes.value ~/ 60;
    controller.tempMinute.value = controller.sleepMinutes.value % 60;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sleep Duration',
              style: globalTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),

            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<int>(
                    value: controller.tempHour.value,
                    items: List.generate(
                      13,
                          (i) => DropdownMenuItem(
                        value: i,
                        child: Text('$i hours'),
                      ),
                    ),
                    onChanged: (v) {
                      controller.tempHour.value = v!;
                    },
                  ),
                  const SizedBox(width: 16),
                  DropdownButton<int>(
                    value: controller.tempMinute.value,
                    items: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55]
                        .map(
                          (m) => DropdownMenuItem(
                        value: m,
                        child: Text('$m minutes'),
                      ),
                    )
                        .toList(),
                    onChanged: (v) {
                      controller.tempMinute.value = v!;
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            AppPrimaryButton(
              width: 200,
              text: "Done",
              onTap: () {
                controller.sleepMinutes.value =
                    controller.tempHour.value * 60 +
                        controller.tempMinute.value;
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  // Repeat Days Picker Methods..........................
  void pickRepeatDays(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Obx(
            () => Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Repeat',
                  style: globalTextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16),
            
                ...controller.allDays.map(
                      (day) => CheckboxListTile(
                    title: Text(day),
                    value: controller.repeatDays.contains(day),
                    onChanged: (v) {
                      if (v == true) {
                        controller.repeatDays.add(day);
                      } else {
                        controller.repeatDays.remove(day);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),
                AppPrimaryButton(
                  width: 200,
                  text: "Done",
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
