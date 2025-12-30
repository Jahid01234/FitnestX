import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:fitnestx/features/meal_planner/model/meal_nutrition_model.dart';
import 'package:fitnestx/features/meal_planner/model/meal_section_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MealScheduleController extends GetxController{
  final CalendarAgendaController agendaController = CalendarAgendaController();
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> selectedDateTime = DateTime.now().obs;
  final RxList<DateTime> events = <DateTime>[].obs;
  RxList<MealSectionModel> mealSectionDataList = <MealSectionModel>[].obs;
  RxList<MealNutritionModel> mealNutritionList = <MealNutritionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMealSectionData();
    loadMealNutritionData();
  }

  void loadMealSectionData(){
    mealSectionDataList.value =  mealSectionsData;
  }
  void loadMealNutritionData(){
    mealNutritionList.value =  mealNutritionData;
  }

  void onDateSelected(DateTime date) {
    selectedDate.value = date;
    selectedDateTime.value = date;
    if (kDebugMode) {
      print('Selected date: $date');
    }
  }

  String getMonthYear() {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return '${months[selectedDate.value.month - 1]} ${selectedDate.value.year}';
  }

  void goToPreviousWeek() {
    final newDate = selectedDate.value.subtract(const Duration(days: 7));
    selectedDate.value = newDate;
    agendaController.goToDay(newDate);
  }

  void goToNextWeek() {
    final newDate = selectedDate.value.add(const Duration(days: 7));
    selectedDate.value = newDate;
    agendaController.goToDay(newDate);
  }

}