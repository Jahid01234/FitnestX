import 'package:fitnestx/features/meal_planner/model/category_model.dart';
import 'package:fitnestx/features/meal_planner/model/recommendation_diet_model.dart';
import 'package:get/get.dart';

class BreakFastController extends GetxController{
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<RecommendationDietModel> recommendationDietList = <RecommendationDietModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCategoryData();
    loadRecommendationDietData();
  }

  void loadCategoryData(){
    categoryList.value = categoryData;
  }

  void loadRecommendationDietData(){
    recommendationDietList.value = recommendationDietData;
  }

}