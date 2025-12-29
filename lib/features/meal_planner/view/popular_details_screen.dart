import 'package:expandable_text/expandable_text.dart';
import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/meal_planner/controller/popular_details_controller.dart';
import 'package:fitnestx/features/meal_planner/model/popular_model.dart';
import 'package:fitnestx/features/meal_planner/view/widgets/ingredients_card.dart';
import 'package:fitnestx/features/meal_planner/view/widgets/nutrition_card.dart';
import 'package:fitnestx/features/meal_planner/view/widgets/step_to_step_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularDetailsScreen extends StatelessWidget {
  PopularDetailsScreen({super.key});

  final PopularDetailsController controller = Get.put(
    PopularDetailsController(),
  );

  final PopularModel popularModel = Get.arguments as PopularModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(color: AppColors.primaryColor2),
          ),

          // Header content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBackButton(bgColor: Colors.white),
                      Text(
                        "Popular Details",
                        style: globalTextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      AppBackButton(
                        icon: Icons.more_horiz,
                        bgColor: Colors.white,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 380,
                      width: 380,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset(popularModel.image, fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Draggable bottom sheet
          DraggableScrollableSheet(
            initialChildSize: 0.55,
            minChildSize: 0.55,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Drag handle
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: getHeight(10)),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          popularModel.title,
                                          style: globalTextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'by ',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'James Ruth',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppColors.primaryColor1,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Obx(
                                        () => IconButton(
                                      onPressed: controller.toggleFavorite,
                                      icon: Icon(
                                        controller.isFavorite.value
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: controller.isFavorite.value
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "Nutrition",
                                style: globalTextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Obx(() => Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: SizedBox(
                                height: 40,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.zero,
                                  itemCount: controller.nutritionList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: NutritionCard(
                                        model: controller.nutritionList[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "Descriptions",
                                style: globalTextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: ExpandableText(
                                "Pancakes are some people's favorite breakfast, who"
                                    " doesn't like pancakes? Especially with the real"
                                    " honey splash on top of the pancakes, of course"
                                    " everyone loves that! besides being.",
                                maxLines: 3,
                                expandText: 'Read more',
                                collapseText: 'Read less',
                                linkColor: AppColors.primaryColor1,
                                style: globalTextStyle(
                                  color: AppColors.gray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Ingredients That You Will Need",
                                      style: globalTextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 100),
                                  Text(
                                    "4 items",
                                    style: globalTextStyle(
                                      fontSize: 14,
                                      color: AppColors.gray,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Obx(() => Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: SizedBox(
                                height: 150,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.zero,
                                  itemCount: controller.ingredientsList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: IngredientsCard(
                                        model: controller.ingredientsList[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Step by Step",
                                    style: globalTextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "5 steps",
                                    style: globalTextStyle(
                                      fontSize: 14,
                                      color: AppColors.gray,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),

                            Obx(() {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  children: List.generate(
                                    controller.stepsDataList.length,
                                        (index) => StepToStepItem(
                                      step: controller.stepsDataList[index],
                                      isLast: index == controller.stepsDataList.length - 1,
                                    ),
                                  ),
                                ),
                              );
                            },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                              child: AppPrimaryButton(
                                text: "Add to Breakfast Meal",
                                textColor: Colors.white,
                                onTap: () {
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
