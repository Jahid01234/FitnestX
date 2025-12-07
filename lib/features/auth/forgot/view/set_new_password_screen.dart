import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/const/icons_path.dart';
import 'package:fitnestx/core/const/images_path.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/global_widgets/custom_text_field.dart';
import 'package:fitnestx/core/global_widgets/success_dialog.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/auth/forgot/controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetNewPasswordScreen extends StatelessWidget {
  SetNewPasswordScreen({super.key});

  final ForgotPasswordController controller =
  Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackButton(),
              SizedBox(height: getHeight(30)),
              Text(
                "Set new password",
                style: globalTextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: getHeight(20)),
              Text(
                "Create your new password so you can share your memories again.",
                textAlign: TextAlign.justify,
                style: globalTextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: getHeight(200)),
              // new password field....
              Obx(
                    () => CustomTextField(
                  obsecureText: controller.isNewPassword.value,
                  controller: controller.newPasswordController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(IconsPath.lock, height: 10),
                      ),
                  hinText: "Enter new password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isNewPassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: controller.toggleNewPassword,
                  ),
                ),
              ),

              SizedBox(height: getHeight(20)),

              // confirm password field....
              Obx(
                    () => CustomTextField(
                  obsecureText: controller.isConfirmPassword.value,
                  controller: controller.confirmPasswordController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(IconsPath.lock, height: 10),
                      ),
                  hinText: "Enter confirm password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isConfirmPassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: controller.toggleConfirmPassword,
                  ),
                ),
              ),

              SizedBox(height: getHeight(200)),
              AppPrimaryButton(
                text: "Verify",
                textColor: AppColors.white,
                onTap: () {
                  Get.to(
                        () => SuccessDialog(
                      image: ImagePath.successImg,
                      title: "Password set successful",
                      subTitle: "Your password has been changed successfully.\nYou"
                          " can now log in with your new password.",
                      buttonText: "Back",
                      onTap: () {
                        Get.offAllNamed(AppRoutes.login);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}