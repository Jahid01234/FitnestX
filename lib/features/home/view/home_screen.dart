import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/home/controller/home_controller.dart';
import 'package:fitnestx/features/home/view/widgets/activity_status_card.dart';
import 'package:fitnestx/features/home/view/widgets/activity_status_card2.dart';
import 'package:fitnestx/features/home/view/widgets/bmi_card_chart_section.dart';
import 'package:fitnestx/features/home/view/widgets/home_header_section.dart';
import 'package:fitnestx/features/home/view/widgets/workout_progress_chart.dart';
import 'package:fitnestx/features/home/view/widgets/workouts_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              HomeHeaderSection(),
              SizedBox(height: getHeight(10)),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BMICardChartSection(),
                      SizedBox(height: getHeight(30)),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.purple.shade50,
                              Colors.blue.shade50,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Today Target",
                                style: globalTextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              AppPrimaryButton(
                                text: "Check",
                                fontSize: 14,
                                bgColor: Color(0xFFD4B5E8),
                                height: 50,
                                weight: 120,
                                textColor: AppColors.white,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: getHeight(30)),
                      Text(
                        "Activity Status",
                        style: globalTextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: getHeight(10)),
                      ActivityStatusCard(),
                      SizedBox(height: getHeight(20)),
                      ActivityStatusCard2(),
                      SizedBox(height: getHeight(30)),
                      WorkoutProgressChart(),
                      SizedBox(height: getHeight(30)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Latest Workout",
                            style: globalTextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoutes.seeMoreLatestWorkout);
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
                          itemCount: controller.workoutsDataList.length,
                          itemBuilder: (context, index) {
                            return WorkoutCard(workout: controller.workoutsDataList[index]);
                          },
                        ),
                      ),
                      SizedBox(height: getHeight(50)),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

