import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/const/icons_path.dart';
import 'package:fitnestx/core/const/images_path.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/profile/controller/profile_controller.dart';
import 'package:fitnestx/features/profile/view/widgets/profile_component_title.dart';
import 'package:fitnestx/features/profile/view/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                "Profile",
                style: globalTextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: getHeight(40)),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Colors.black12,
                                width: 2,
                              ),
                            ),
                            child: Image.asset(
                              ImagePath.workOut1,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Stefani Wong",
                                  style: globalTextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                                Text(
                                  "Lose a Fat Program",
                                  style: globalTextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppPrimaryButton(
                            text: "Edit",
                            textColor: AppColors.white,
                            onTap: () {},
                            height: 50,
                            width: 100,
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      // Top User Body Data (Height / Weight / Age)
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildTopBox(
                              "${controller.height.value.toInt()}cm",
                              "Height",
                            ),
                            buildTopBox(
                              "${controller.weight.value.toInt()}kg",
                              "Weight",
                            ),
                            buildTopBox("${controller.age.value}yo", "Age"),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ========== Account ==========
                      ProfileComponentTitle(
                        title: "Account",
                        children: [
                          ProfileTile(
                            image: IconsPath.personal,
                            title: "Personal Data",
                          ),
                          ProfileTile(
                            image: IconsPath.achievement,
                            title: "Achievement",
                          ),
                          ProfileTile(
                            image: IconsPath.activityHistory,
                            title: "Activity History",
                          ),
                          ProfileTile(
                            image: IconsPath.workoutProgress,
                            title: "Workout Progress",
                          ),
                        ],
                      ),

                      // ========== Notification ==========
                      ProfileComponentTitle(
                        title: "Notification",
                        children: [
                          Obx(
                            () => ProfileTile(
                              image: IconsPath.popUpNotification,
                              title: "Pop-up Notification",
                              trailing: Switch(
                                value: controller.popupNotification.value,
                                activeColor: AppColors.primaryColor2,
                                onChanged: controller.togglePopup,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // ========== Other ==========
                      ProfileComponentTitle(
                        title: "Other",
                        children: [
                          ProfileTile(
                            image: IconsPath.contactUs,
                            title: "Contact Us",
                          ),
                          ProfileTile(
                            image: IconsPath.privacy,
                            title: "Privacy Policy",
                          ),
                          ProfileTile(
                            image: IconsPath.setting,
                            title: "Settings",
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
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

  // Top Three Boxes
  Widget buildTopBox(String value, String title) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 18,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: globalTextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor1,
            ),
          ),
          Text(
            title,
            style: globalTextStyle(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
