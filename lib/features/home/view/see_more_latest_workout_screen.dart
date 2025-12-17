import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/const/images_path.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/global_widgets/success_dialog.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/home/controller/home_controller.dart';
import 'package:fitnestx/features/home/view/widgets/workouts_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeMoreLatestWorkoutScreen extends StatelessWidget {
  SeeMoreLatestWorkoutScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  AppBackButton(),
                  const SizedBox(width: 15),
                  Text(
                    "Latest Workouts",
                    style: globalTextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              SizedBox(height: getHeight(40)),

              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.workoutsDataList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(
                              () => SuccessDialog(
                            image: ImagePath.loginSuccessImg,
                            title: "Congratulations, You Have\n Finished Your Workout",
                            subTitle: "Exercises is king and nutrition is queen.\n Combine the two and you will have a kingdom\n-Jack Lalanne",
                            buttonText: "Back To Home",
                            onTap: () {
                              Get.offAllNamed(AppRoutes.bottomNavBar);
                            },
                          ),
                        );
                      },
                      child: WorkoutCard(
                        workout: controller.workoutsDataList[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
