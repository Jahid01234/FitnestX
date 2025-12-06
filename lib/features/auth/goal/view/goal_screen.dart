import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/auth/goal/controller/goal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoalScreen extends StatelessWidget {
  GoalScreen({super.key});

  final GoalController controller = Get.put(GoalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: getHeight(50)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center ,
                children: [
                  Text(
                    "What is your goal ?",
                    style: globalTextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: getHeight(5)),
                  Text(
                    "It will help us to choose a best\n program for you",
                    textAlign: TextAlign.center,
                    style: globalTextStyle(
                      color: AppColors.gray,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getHeight(40)),
            /// 🔥 CarouselSlider Here
            Obx(() => CarouselSlider(
              items: controller.goalPage.map((goal) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: AppColors.appGradient1,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Image.asset(goal.image, height: 284,fit: BoxFit.cover,)),
                      const SizedBox(height: 20),
                      Text(
                        goal.title,
                        style: globalTextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 90),
                        child: Center(
                          child: Divider(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: getHeight(20)),
                      Text(
                        goal.subTitle,
                        textAlign: TextAlign.center,
                        style: globalTextStyle(
                          color: AppColors.white.withValues(alpha: 0.9),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration:
                const Duration(milliseconds: 800),
                viewportFraction: 0.75,
                aspectRatio: 0.8,
                initialPage: 0
              ),
            )),
            SizedBox(height: getHeight(60)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppPrimaryButton(
                text: "Continue",
                textColor: AppColors.white,
                onTap: (){
                  Get.toNamed(AppRoutes.login);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}