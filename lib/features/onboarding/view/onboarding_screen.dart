import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/onboarding/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // page view...........
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: (index) => controller.currentIndex.value = index,
              itemCount: controller.onboardingPage.length,
              itemBuilder: (context, index) {
                final item = controller.onboardingPage[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(item.image,fit: BoxFit.cover),
                    SizedBox(height: getHeight(35)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        item.title,
                        style: globalTextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: getHeight(15)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        item.subTitle,
                        style: globalTextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          // Tap next button........
          Padding(
            padding: const EdgeInsets.only(bottom: 30, right: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: controller.nextPage,
                child: Obx(
                  () => Stack(
                    alignment: Alignment.center,
                    children: [
                      // Circular Progress Indicator
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor2,
                          value: (controller.currentIndex.value + 1) /
                                 controller.onboardingPage.length,
                          strokeWidth: 3,
                        ),
                      ),

                      // Inner Button
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor2,
                         //gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
