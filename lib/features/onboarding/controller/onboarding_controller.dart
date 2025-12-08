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
    _precacheImages();
  }


  void loadOnboardingPage(){
    onboardingPage.addAll(onboardingItemsListData);
  }

  void _precacheImages() {
    Future.delayed(Duration.zero, () {
      for (var items in onboardingItemsListData) {
        precacheImage(AssetImage(items.image), Get.context!);
      }
    });
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


  void finishOnboarding() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}