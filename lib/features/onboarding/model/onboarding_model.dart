import 'package:fitnestx/core/const/images_path.dart';

class OnboardingModel{
  final String title;
  final String subTitle;
  final String image;

  OnboardingModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });

}

List<OnboardingModel> onboardingItemsListData = [
  OnboardingModel(
    title: "Track Your Goal",
    subTitle: "Don't worry if you have trouble determining your goals, We can "
              "help you determine your goals and track your goals",
    image: ImagePath.onboarding1,
  ),
  OnboardingModel(
    title: "Get Burn",
    subTitle: "Let’s keep burning, to achive yours goals, it hurts only "
              "temporarily, if you give up now you will be in pain forever",
    image: ImagePath.onboarding2,
  ),
  OnboardingModel(
    title: "Eat Well",
    subTitle: "Let's start a healthy lifestyle with us, we can determine your "
              "diet every day. healthy eating is fun",
    image: ImagePath.onboarding3,
  ),
  OnboardingModel(
    title: "Improve Sleep  Quality",
    subTitle: "Improve the quality of your sleep with us, good quality sleep can"
              " bring a good mood in the morning",
    image: ImagePath.onboarding4,
  ),
];