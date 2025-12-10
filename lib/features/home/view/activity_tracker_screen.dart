import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/home/controller/activity_tracker_controller.dart';
import 'package:fitnestx/features/home/view/widgets/activity_card.dart';
import 'package:fitnestx/features/home/view/widgets/today_target_card.dart';
import 'package:fitnestx/features/home/view/widgets/weekly_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityTrackerScreen extends StatelessWidget {
  ActivityTrackerScreen({super.key});

  final ActivityTrackerController controller = Get.put(
    ActivityTrackerController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
          
                // ─── Header ───────────────────────────────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppBackButton(),
                    Text(
                      "Activity Tracker",
                      style: globalTextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const AppBackButton(
                      icon: Icons.more_horiz,
                    ),
                  ],
                ),
          
                SizedBox(height: getHeight(40)),
          
                /// ─── Today Target Card ─────────────────────────────────────────
                TodayTargetCard(),
                SizedBox(height: getHeight(40)),
                WeeklyBarChart(),
                SizedBox(height: getHeight(30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Activity",
                      style: globalTextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.seeMoreLatestActivity);
                      },
                      child: Text(
                        "See more",
                        style: globalTextStyle(
                          color: AppColors.primaryColor2,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getHeight(10)),
                Obx(
                      () => ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.activityData.length >= 2
                            ? 2
                            : controller.activityData.length,
                    itemBuilder: (context, index) {
                      return ActivityCard(activity: controller.activityData[index]);
                    },
                  ),
                ),
                SizedBox(height: getHeight(50)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

