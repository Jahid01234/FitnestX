import 'package:fitnestx/features/auth/complete_profile/view/complete_profile_screen.dart';
import 'package:fitnestx/features/auth/goal/view/goal_screen.dart';
import 'package:fitnestx/features/auth/login/view/login_screen.dart';
import 'package:fitnestx/features/auth/signUp/view/sign_up_screen.dart';
import 'package:fitnestx/features/onboarding/view/onboarding_screen.dart';
import 'package:fitnestx/features/splash/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Get routes name here.......
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String signUp = '/signUp';
  static const String completeProfile = '/completeProfile';
  static const String goalScreen = '/goalScreen';
  static const String login = '/login';






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
    GetPage(
      name: completeProfile,
      page: ()=> CompleteProfileScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: goalScreen,
      page: ()=> GoalScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: login,
      page: ()=> LoginScreen(),
      transition: Transition.leftToRight,
    ),
  ];
}