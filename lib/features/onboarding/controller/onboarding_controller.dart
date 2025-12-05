import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/features/onboarding/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentIndex = 0.obs;

  RxList onboardingPage = <OnboardingModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadOnboardingPage();
  }


  void loadOnboardingPage(){
    onboardingPage.addAll(onboardingItemsListData);
  }

  void nextPage() {
    if (currentIndex.value < onboardingPage.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      finishOnboarding();
    }
  }

  void skip() {
    finishOnboarding();
  }

  void finishOnboarding() {
    //Get.offNamed(AppRoutes.welcome);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}