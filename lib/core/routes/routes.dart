import 'package:fitnestx/features/auth/signUp/view/sign_up_screen.dart';
import 'package:fitnestx/features/onboarding/view/onboarding_screen.dart';
import 'package:fitnestx/features/splash/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Get routes name here.......
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String signUp = '/signUp';






  // Get routes here.......
  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: ()=> SplashScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: onboarding,
      page: ()=> OnboardingScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: signUp,
      page: ()=> SignUpScreen(),
      transition: Transition.leftToRight,
    ),
  ];
}