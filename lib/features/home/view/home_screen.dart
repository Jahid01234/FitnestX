import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/home/view/widgets/activity_status_card.dart';
import 'package:fitnestx/features/home/view/widgets/bmi_card_chart_section.dart';
import 'package:fitnestx/features/home/view/widgets/home_header_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

