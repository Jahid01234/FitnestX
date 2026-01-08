import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/progress_tracker/controller/compare_result_controller.dart';
import 'package:fitnestx/features/progress_tracker/view/photo_content_screen.dart';
import 'package:fitnestx/features/progress_tracker/view/statistic_content_screen.dart';
import 'package:fitnestx/features/progress_tracker/view/widgets/tab_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompareResultScreen extends StatelessWidget {
  CompareResultScreen({super.key});

  final CompareResultController controller = Get.put(CompareResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBackButton(),
                Text(
                  "Result",
                  style: globalTextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppBackButton(icon: Icons.more_horiz, onTap: () {}),
              ],
            ),
            const SizedBox(height: 30),
            // tab view........
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => TabViewWidget(
                        text: 'Photo',
                        isSelected: controller.selectedIndex.value == 0,
                        onTap: () => controller.changeTab(0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => TabViewWidget(
                        text: 'Statistic',
                        isSelected: controller.selectedIndex.value == 1,
                        onTap: () => controller.changeTab(1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Tab Content
            Expanded(
              child: Obx(() {
                return controller.selectedIndex.value == 0
                    ? PhotoContentScreen(controller: controller)
                    : StatisticContentScreen(controller: controller);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
