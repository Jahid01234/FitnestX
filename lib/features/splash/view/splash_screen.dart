import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Fitnest",
                      style: globalTextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                      ),
                      children: [
                        TextSpan(
                          text: "X",
                          style: globalTextStyle(
                            color: AppColors.primaryColor1,
                            fontWeight: FontWeight.w800,
                            fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Everybody can train",
                    style: globalTextStyle(
                      color: AppColors.gray,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: SpinKitCircle(color: AppColors.primaryColor1, size: 70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
