import 'package:fitnestx/features/meal_planner/model/category_model.dart';
import 'package:get/get.dart';

class BreakFastController extends GetxController{
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCategoryData();
  }

  void loadCategoryData(){
    categoryList.value = categoryData;
  }

}