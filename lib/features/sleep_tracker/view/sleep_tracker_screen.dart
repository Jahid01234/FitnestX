import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/sleep_tracker/controller/sleep_tracker_controller.dart';
import 'package:fitnestx/features/sleep_tracker/view/widgets/sleep_tracker_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SleepTrackerScreen extends StatelessWidget {
  SleepTrackerScreen({super.key});

  final SleepTrackerController controller = Get.put(SleepTrackerController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 50,left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBackButton(),
                    Text(
                      "Sleep Tracker",
                      style: globalTextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppBackButton(
                      icon: Icons.more_horiz,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: SleepTrackerChart (controller: controller),
                      ),

                      SizedBox(height: 30),
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
