import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/features/onboarding/view/onboarding_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    redirectToNextScreen();
  }

  Future<void> redirectToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
     //Get.offNamed(AppRoutes.onboarding);
    Get.to(OnboardingScreen());
  }
}
