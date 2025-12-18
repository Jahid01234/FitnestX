import 'package:fitnestx/features/workout_tracker/model/equipment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WorkoutDetailsController extends GetxController{
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString difficulty = 'Beginner'.obs;
  var isFavorite = false.obs;
  RxList<EquipmentModel> equipmentDataList = <EquipmentModel>[].obs;


  @override
  void onInit() {
    super.onInit();
    loadEquipmentData();
  }

  void loadEquipmentData(){
    equipmentDataList.value = equipmentData;
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }


  // Date Picker.........
  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(3000),
    );

    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  String get formattedDate => DateFormat('M/d, hh:mm a').format(selectedDate.value);

  // Difficulty Bottom Sheet..........
  void showDifficultySheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _item('Beginner'),
            _item('Medium'),
            _item('Advanced'),
          ],
        ),
      ),
    );
  }

  Widget _item(String value) {
    return ListTile(
      title: Text(value),
      onTap: () {
        difficulty.value = value;
        Get.back();
      },
    );
  }

}