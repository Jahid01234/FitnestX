import 'package:fitnestx/features/meal_planner/model/ingredients_model.dart';
import 'package:fitnestx/features/meal_planner/model/nutrition_model.dart';
import 'package:fitnestx/features/meal_planner/model/step_to_step_model.dart';
import 'package:get/get.dart';

class PopularDetailsController extends GetxController{
  RxList<NutritionModel> nutritionList = <NutritionModel>[].obs;
  RxList<IngredientsModel> ingredientsList = <IngredientsModel>[].obs;
  RxList<StepToStepModel> stepsDataList = <StepToStepModel>[].obs;
  var isFavorite = false.obs;


  @override
  void onInit() {
    super.onInit();
    loadNutritionModelData();
    loadIngredientsModelData();
    loadStepData();
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void loadNutritionModelData(){
    nutritionList.value = nutritionModelData;
  }

  void loadIngredientsModelData(){
    ingredientsList.value = ingredientsModelData;
  }

  void loadStepData(){
    stepsDataList.value = steps;
  }


}