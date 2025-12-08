import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/const/images_path.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BMICardChartSection extends StatelessWidget {
  const BMICardChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: AppColors.appGradient1,
        image: DecorationImage(
          image: AssetImage(ImagePath.bmiBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side - Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'BMI (Body Mass Index)',
                    style: globalTextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "You have a normal weight",
                    style: globalTextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 16),
                  AppPrimaryButton(
                    text: "View More",
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

            // Right side - Chart
            SizedBox(width: getWidth(10)),
            SizedBox(
              width: 110,
              height: 110,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  PieChart(
                    PieChartData(
                      startDegreeOffset: -90,
                      sectionsSpace: 10,
                      centerSpaceRadius: 5,
                      sections: [
                        PieChartSectionData(
                            value: 30,
                            radius: 60,
                            title: "20,1",
                            titleStyle: globalTextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),
                            color: Color(0xFFD4B5E8)
                        ),
                        PieChartSectionData(
                            value: 80,
                            radius: 55,
                            color: Colors.transparent,
                            title: ""
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
