import 'package:fitnestx/features/auth/signUp/controller/sign_up_controller.dart';
import 'package:fitnestx/features/onboarding/controller/onboarding_controller.dart';
import 'package:fitnestx/features/splash/controller/splash_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(OnboardingController());
    Get.put(SignupController());
  }
}