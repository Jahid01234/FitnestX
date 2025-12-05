import 'package:fitnestx/features/onboarding/view/onboarding_screen.dart';
import 'package:fitnestx/features/splash/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Get routes name here.......
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';






  // Get routes here.......
  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: ()=> SplashScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: splash,
      page: ()=> OnboardingScreen(),
      transition: Transition.leftToRight,
    ),
  ];
}