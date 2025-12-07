import 'package:fitnestx/core/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitnestx/features/bottom_nav/controller/bottom_nav_bar_controller.dart';
import 'package:fitnestx/core/const/icons_path.dart';

class BottomNavBarScreen extends StatelessWidget {
  BottomNavBarScreen({super.key});

  final BottomNavBarController controller = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.pages[controller.selectedIndex.value],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GestureDetector(
          onTap: () {},
          child: Container(
            height: 65,
            width: 65,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.appGradient1,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Image.asset(IconsPath.search, height: 20, width: 20),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(color: Colors.white54),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(0),
              _navItem(1),
              const SizedBox(width: 60),
              _navItem(2),
              _navItem(3),
            ],
          ),
        ),
      ),
    );
  }

  // build nav item.............................
  Widget _navItem(int index) {
    bool isSelected = controller.selectedIndex.value == index;
    String iconPath = isSelected
        ? controller.navItems[index]['active']!
        : controller.navItems[index]['inactive']!;
    return GestureDetector(
      onTap: () => controller.changeIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath, height: 24, width: 24),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              height: 7,
              width: 7,
              decoration: const BoxDecoration(
                color: AppColors.secondaryColor1,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
