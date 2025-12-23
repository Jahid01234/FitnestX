import 'package:fitnestx/features/meal_planner/model/meal_option_model.dart';
import 'package:fitnestx/features/meal_planner/model/meals_model.dart';
import 'package:get/get.dart';

class MealPlannerController extends GetxController{
  RxList<MealsModel> mealsList = <MealsModel>[].obs;
  RxList<MealOptionModel> mealOptionList = <MealOptionModel>[].obs;
  final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final List<double> chartData = [62, 44, 63, 37, 80, 20, 60];
  var selectedDayIndex = 4.obs;
  var period = 'Weekly'.obs;
  var mealTiming = "Breakfast".obs;
  var selectedMeal = "".obs;
  final Map<String, Map<String, dynamic>> nutritionStats = {
    'Calories': {'value': 82, 'isUp': true},
    'Sugar': {'value': 39, 'isUp': false},
    'Fibre': {'value': 88, 'isUp': true},
    'Fats': {'value': 42, 'isUp': false},
  };

  @override
  void onInit() {
    super.onInit();
    loadMealsData();
    loadMealOptionData();
  }

  void loadMealsData(){
    mealsList.value = mealsDataList;
  }
  void loadMealOptionData(){
    mealOptionList.value = mealOptionData;
  }

  void selectDay(int index) {
    selectedDayIndex.value = index;
  }

  void changePeriod() {
    if (period.value == 'Weekly') {
      period.value = 'Monthly';
    } else {
      period.value = 'Weekly';
    }
  }

  void toggleMealTiming() {
    if (mealTiming.value == "Breakfast") {
      mealTiming.value = "Lunch";
    } else if (mealTiming.value == "Lunch") {
      mealTiming.value = "Dinner";
    } else {
      mealTiming.value = "Breakfast";
    }
  }

  void toggleMealList(int index, bool value) {
    mealsList[index].active = value;
    mealsList.refresh();
  }

  void selectMeal(String meal) {
    selectedMeal.value = meal;
  }
}