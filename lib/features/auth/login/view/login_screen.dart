import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/const/icons_path.dart';
import 'package:fitnestx/core/const/images_path.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/global_widgets/custom_text_field.dart';
import 'package:fitnestx/core/global_widgets/success_dialog.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/auth/signUp/controller/sign_up_controller.dart';
import 'package:fitnestx/features/auth/signUp/view/Widgets/header_section.dart';
import 'package:fitnestx/features/auth/signUp/view/Widgets/social_media_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getHeight(70)),
              HeaderSection(),
              SizedBox(height: getHeight(40)),
              CustomTextField(
                controller: controller.emailController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(IconsPath.email, height: 10),
                ),
                hinText: "Email",
              ),
              SizedBox(height: getHeight(20)),
              Obx(
                    () => CustomTextField(
                  obsecureText: controller.isPasswordHidden.value,
                  controller: controller.passwordController,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(IconsPath.lock, height: 10),
                  ),
                  hinText: "Password",
                  suffixIcon: IconButton(
                    onPressed: controller.togglePasswordVisibility,
                    icon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.gray,
                    ),
                  ),
                ),
              ),
              SizedBox(height: getHeight(20)),
              GestureDetector(
                onTap: () {
                   Get.toNamed(AppRoutes.forgetPassword);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password?",
                    style: globalTextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ).copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),

              SizedBox(height: getHeight(230)),
              AppPrimaryButton(
                text: "Login",
                textColor: AppColors.white,
                onTap: () {
                  Get.to(
                        () => SuccessDialog(
                      image: ImagePath.loginSuccessImg,
                      title: "Welcome, Stefani",
                      subTitle: "You are all set now, let’s reach your\ngoals together with us",
                      buttonText: "Go To Home",
                      onTap: () {
                        //Get.offAllNamed(AppRoutes.home);
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: getHeight(60)),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.gray.withValues(alpha: 0.5),
                    ),
                  ),
                  Text(
                    " Or ",
                    style: globalTextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.gray.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getHeight(20)),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SocialMediaButton(image: IconsPath.google, onTap: () {}),
                    SizedBox(width: getWidth(40)),
                    SocialMediaButton(image: IconsPath.facebook, onTap: () {}),
                  ],
                ),
              ),
              SizedBox(height: getHeight(30)),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don’t have an account yet? ",
                    style: globalTextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "Register",
                        style: globalTextStyle(
                          fontSize: 15,
                          color: AppColors.secondaryColor1,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(AppRoutes.signUp);
                          },
                      ),
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
