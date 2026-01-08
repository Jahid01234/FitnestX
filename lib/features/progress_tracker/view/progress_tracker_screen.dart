import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/global_widgets/activities_action_card.dart';
import 'package:fitnestx/core/global_widgets/floating_action_button_widget.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/progress_tracker/controller/progress_tracker_controller.dart';
import 'package:fitnestx/features/progress_tracker/view/widgets/progress_month_card.dart';
import 'package:fitnestx/features/progress_tracker/view/widgets/reminder_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressTrackerScreen extends StatelessWidget {
  ProgressTrackerScreen({super.key});

  final ProgressTrackerController controller = Get.put(
    ProgressTrackerController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButtonWidget(
        icon: Icons.photo_camera_outlined,
        onPressed: () {
          Get.toNamed(AppRoutes.checkFitnessBody);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Center(
                child: Text(
                  "Progress Tracker",
                  style: globalTextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReminderCard(),
                    const SizedBox(height: 30),
                    ProgressMonthCard(),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ActivitiesActionCard(
                        title: "Compare my Photo",
                        buttonText: "Compare",
                        gradientColors: [
                          Colors.blue.shade50,
                          Colors.blue.shade50,
                        ],
                        onTap: () {
                          Get.toNamed(AppRoutes.compare);
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gallery",
                            style: globalTextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "See more",
                              style: globalTextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.gallerySectionDataList.length,
                        itemBuilder: (context, index) {
                          final gallery = controller.gallerySectionDataList[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15),
                              Text(
                                gallery.sectionTitle,
                                style: globalTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 160,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.zero,
                                  itemCount: gallery.items.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          gallery.items[index].image,
                                          height: 150,
                                          width: 150,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }),
                    const SizedBox(height: 50),
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
