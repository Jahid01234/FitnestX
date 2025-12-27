import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/meal_planner/controller/break_fast_controller.dart';
import 'package:fitnestx/features/meal_planner/view/widgets/category_card.dart';
import 'package:fitnestx/features/meal_planner/view/widgets/search_filter_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BreakFastScreen extends StatelessWidget {
  BreakFastScreen({super.key});

  final BreakFastController controller = Get.put(BreakFastController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 50,left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBackButton(),
                    Text(
                      "Breakfast",
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
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchFilterSection(),
                      SizedBox(height: 30),
                      Text(
                        "Category",
                        style: globalTextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Obx(() => SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemCount: controller.categoryList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: CategoryCard(
                                model: controller.categoryList[index],
                                index: index,
                              ),
                            );
                          },
                        ),
                      ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Recommendation for Diet",
                        style: globalTextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
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

