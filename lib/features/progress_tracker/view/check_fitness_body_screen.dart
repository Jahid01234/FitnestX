import 'dart:io';
import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/images_path.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/progress_tracker/controller/check_fitness_body_controller.dart';
import 'package:fitnestx/features/progress_tracker/view/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckFitnessBodyScreen extends StatelessWidget {
  CheckFitnessBodyScreen({super.key});

  final CheckFitnessBodyController controller = Get.put(
    CheckFitnessBodyController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: AppColors.primaryColor1),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Obx(() {
                    return controller.selectedImage.value != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              controller.selectedImage.value!,
                              height: 400,
                              fit: BoxFit.contain,
                            ),
                          )
                        : Image.asset(ImagePath.fullBody, height: 400);
                  }),
                  const SizedBox(height: 50),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ActionButtonWidget(
                          icon: Icons.auto_fix_high,
                          onTap: () {},
                        ),
                        ActionButtonWidget(
                          icon: Icons.camera_alt,
                          isCenter: true,
                          onTap: controller.pickFromCamera,
                        ),
                        ActionButtonWidget(
                          icon: Icons.photo_library,
                          onTap: controller.pickFromGallery,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Obx(() {
              if (controller.galleryImages.isEmpty) {
                return Center(
                  child: Text(
                    "Gallery images will appear here",
                    style: globalTextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.galleryImages.length,
                itemBuilder: (context, index) {
                  final File image = controller.galleryImages[index];
                  return GestureDetector(
                    onTap: () => controller.selectedImage,
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: controller.selectedImage.value == image
                              ? AppColors.secondaryColor2
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(image, fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
