import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/const/icons_path.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/global_widgets/custom_text_field.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/auth/forgot/controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final ForgotPasswordController controller = Get.put(ForgotPasswordController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBackButton(),
            SizedBox(height: getHeight(30)),
            Text(
              "Forgot password?",
              style: globalTextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: getHeight(20)),
            Text(
              "Please enter your email address so we can send you instructions to reset your password.",
              textAlign: TextAlign.justify,
              style: globalTextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: getHeight(100)),
            // Text Email Field....
            CustomTextField(
              controller: controller.emailController,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(IconsPath.email, height: 10),
              ),
              hinText: "Email",
            ),
            Spacer(),
            // Button part...
            AppPrimaryButton(
              text: "Next >",
              textColor: AppColors.white,
              onTap: (){
                Get.toNamed(AppRoutes.otpVerify);
              },
            ),
            SizedBox(height: getHeight(100)),
          ],
        ),
      ),
    );
  }
}