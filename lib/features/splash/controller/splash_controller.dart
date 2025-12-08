import 'package:fitnestx/core/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    redirectToNextScreen();
  }

  Future<void> redirectToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
     Get.offNamed(AppRoutes.onboarding);
  }
}
