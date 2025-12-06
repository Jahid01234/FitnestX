import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  List<int> weightList = [40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100];
  List<int> heightList = [140, 145, 150, 155, 160, 165, 170, 175, 180, 185, 190];

  // Gender selection...........
  void selectGender(String gender) {
    genderController.text = gender;
  }



  // Weight selection...........
  void selectWeight(int weight) {
    weightController.text = weight.toString();
  }

  void saveManualWeight(String weight) {
    if (weight.isNotEmpty) {
      weightController.text = weight;
    }
  }

  // Height selection...........
  void selectHeight(int height) {
    heightController.text = height.toString();
  }

  void saveManualHeight(String height) {
    if (height.isNotEmpty) {
      heightController.text = height;
    }
  }


 // Date picker.........
  Future<void> chooseDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      dobController.text = "${date.day}/${date.month}/${date.year}";
    }
  }

  @override
  void dispose() {
    genderController.dispose();
    dobController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }
}