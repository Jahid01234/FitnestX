import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/const/icons_path.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/global_widgets/custom_text_field.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/auth/signUp/controller/sign_up_controller.dart';
import 'package:fitnestx/features/auth/signUp/view/Widgets/header_section.dart';
import 'package:fitnestx/features/auth/signUp/view/Widgets/social_media_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignupController controller = Get.find<SignupController>();

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
                controller: controller.firstNameController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(IconsPath.person, height: 10),
                ),
                hinText: "First name",
              ),
              SizedBox(height: getHeight(20)),
              CustomTextField(
                controller: controller.lastNameController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(IconsPath.person, height: 10),
                ),
                hinText: "Last name",
              ),
              SizedBox(height: getHeight(20)),
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
              Obx(
                () => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    GestureDetector(
                      onTap: controller.toggleCheck,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.gray, width: 1),
                          color: controller.isChecked.value
                              ? AppColors.white
                              : Colors.transparent,
                        ),
                        child: controller.isChecked.value
                            ? Icon(Icons.check, size: 16, color: Colors.black)
                            : null,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "By continuing you accept our Privacy Policy and Term of Use",
                        style: globalTextStyle(
                          color: AppColors.gray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getHeight(60)),
              AppPrimaryButton(
                text: "Register",
                textColor: AppColors.white,
                onTap: () {},
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
                    "Or Continue",
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
                    text: "Already have an account? ",
                    style: globalTextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: globalTextStyle(
                          fontSize: 15,
                          color: AppColors.secondaryColor1,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //Get.toNamed(AppRoutes.register);
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
