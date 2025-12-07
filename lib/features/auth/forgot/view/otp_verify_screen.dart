import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/auth/forgot/controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpVerifyScreen extends StatelessWidget {
  OtpVerifyScreen({super.key});

  final ForgotPasswordController controller = Get.find<ForgotPasswordController>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackButton(),
              SizedBox(height: getHeight(30)),
              Text(
                "Verification code",
                style: globalTextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: getHeight(20)),
              Text(
                "We have to sent the code verification to your email address.",
                textAlign: TextAlign.justify,
                style: globalTextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: getHeight(200)),
              // Otp field....
              Center(
                child: Pinput(
                  length: 4,
                  controller: controller.otpController,
                  defaultPinTheme: PinTheme(
                    margin: EdgeInsets.only(right: 15),
                    width: 50,
                    height: 50,
                    textStyle: globalTextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.2),
                      border: Border.all(
                        color: AppColors.primaryColor2,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              SizedBox(height: getHeight(300)),
              // Button part...
              AppPrimaryButton(
                text: "Next >",
                textColor: AppColors.white,
                onTap: (){
                  Get.toNamed(AppRoutes.setNewPassword);
                },
              ),
              SizedBox(height: getHeight(100)),
            ],
          ),
        ),
      )
    );
  }
}