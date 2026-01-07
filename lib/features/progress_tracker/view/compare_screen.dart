import 'package:fitnestx/core/const/icons_path.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/progress_tracker/controller/progress_tracker_controller.dart';
import 'package:fitnestx/features/progress_tracker/view/widgets/compare_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompareScreen extends StatelessWidget {
  CompareScreen({super.key});

  final ProgressTrackerController controller = Get.put(
    ProgressTrackerController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBackButton(),
                Text(
                  "Comparison",
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
            const SizedBox(height: 30),
            Obx(() =>
                CompareOptionTile(
                icon: IconsPath.calendar,
                title: 'Select Month 1',
                subtitle: controller.selectedMonth1.value,
                onTap: () => pickMonth(context, 1),
              ),
            ),
            const SizedBox(height: 12),
            Obx(() =>
                CompareOptionTile(
                icon: IconsPath.calendar,
                title: 'Select Month 2',
                  subtitle: controller.selectedMonth2.value,
                  onTap: () => pickMonth(context, 2),
              ),
            ),
            Spacer(),
            AppPrimaryButton(
              text: "Compare",
              textColor: Colors.white,
              onTap: () {
                Get.toNamed(AppRoutes.compareResult);
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // Pick month............
  void pickMonth(BuildContext context, int monthNumber) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle
              Row(
                children: [
                  Spacer(),
                  Container(
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.clear, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Title
              Text(
                'Select Month',
                style: globalTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Month list
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.months.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  itemBuilder: (context, index) {
                    final isSelected = monthNumber == 1
                        ? controller.selectedMonth1.value == controller.months[index]
                        : controller.selectedMonth2.value == controller.months[index];
                    return Material(
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () {
                          if (monthNumber == 1) {
                            controller.selectedMonth1.value = controller.months[index];
                          } else {
                            controller.selectedMonth2.value = controller.months[index];
                          }
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.months[index],
                                style: globalTextStyle(
                                  fontSize: 16,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: isSelected
                                      ? Color(0xFF92A3FD)
                                      : Colors.black87,
                                ),
                              ),
                              if (isSelected)
                                Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF92A3FD),
                                  size: 22,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
