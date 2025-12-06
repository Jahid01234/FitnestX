import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/const/icons_path.dart';
import 'package:fitnestx/core/global_widgets/custom_text_field.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/auth/complete_profile/controller/complete_profile_controller.dart';
import 'package:fitnestx/features/auth/complete_profile/view/widgets/complete_profile_header_section.dart';
import 'package:fitnestx/features/auth/complete_profile/view/widgets/measurement_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({super.key});

  final CompleteProfileController controller = Get.put(CompleteProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
          child: Column(
            children: [
              SizedBox(height: getHeight(40)),
              CompleteProfileHeaderSection(),
              SizedBox(height: getHeight(30)),
              // Gender Field..............
              CustomTextField(
                controller: controller.genderController,
                readOnly: true,
                onTap: () => _showGenderBottomSheet(context),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(IconsPath.person, height: 10),
                ),
                hinText: "Choose gender",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(IconsPath.dropDown, height: 10),
                ),
              ),
              SizedBox(height: getHeight(20)),

              // Date of Birth...............
              CustomTextField(
                controller: controller.dobController,
                readOnly: true,
                onTap: () => controller.chooseDate(context),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(IconsPath.calendar, height: 10),
                ),
                hinText: "Date of birth",
              ),
              SizedBox(height: getHeight(20)),

              // Weight Field .............
              MeasurementField(
                controller: controller.weightController,
                hintText: "Your weight",
                iconPath: IconsPath.weight,
                unit: "Kg",
                onUnitTap: () => _showWeightBottomSheet(context),
              ),
              SizedBox(height: getHeight(20)),

              // Height Field ..........
              MeasurementField(
                controller: controller.heightController,
                hintText: "Your height",
                iconPath: IconsPath.height,
                unit: "Cm",
                onUnitTap: () => _showHeightBottomSheet(context),
              ),
              SizedBox(height: getHeight(40)),

              // Next Button
              AppPrimaryButton(
                text: "Next >",
                onTap: (){},
              ),
              SizedBox(height: getHeight(30)),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------
  //                GENDER BOTTOM SHEET
  // ---------------------------------------------------------
  void _showGenderBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            _buildCrossBottomShitButton(),
            Center(
              child: Text(
                "Select Gender",
                style: globalTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.male),
              title: Text(
                "Male",
                style: globalTextStyle(fontSize: 16),
              ),
              onTap: () {
                controller.selectGender("Male");
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.female),
              title: Text(
                "Female",
                style: globalTextStyle(fontSize: 16),
              ),
              onTap: () {
                controller.selectGender("Female");
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }


  // ---------------------------------------------------------
  //                WEIGHT BOTTOM SHEET
  // ---------------------------------------------------------
  void _showWeightBottomSheet(BuildContext context) {
    final TextEditingController kgInput =
    TextEditingController(text: controller.weightController.text);

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              _buildCrossBottomShitButton(),
              Center(
                child: Text(
                  "Select Your Weight",
                  style: globalTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: controller.weightList.map((w) {
                  return _buildOptionChip(
                    label: "$w Kg",
                    onTap: () {
                      controller.selectWeight(w);
                      Get.back();
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 25),
              Text(
                "Or Enter manually",
                style: globalTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: kgInput,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "E.g. 65",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AppPrimaryButton(
                text: 'Save',
                onTap: () {
                  controller.saveManualWeight(kgInput.text);
                  Get.back();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------
  //                HEIGHT BOTTOM SHEET
  // ---------------------------------------------------------
  void _showHeightBottomSheet(BuildContext context) {
    final TextEditingController cmInput =
    TextEditingController(text: controller.heightController.text);

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              _buildCrossBottomShitButton(),
              Center(
                child: Text(
                  "Select Your Height",
                  style: globalTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: controller.heightList.map((h) {
                  return _buildOptionChip(
                    label: "$h cm",
                    onTap: () {
                      controller.selectHeight(h);
                      Get.back();
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 25),
              Text(
                "Or Enter manually",
                style: globalTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: cmInput,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "E.g. 170",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AppPrimaryButton(
                text: 'Save',
                onTap: () {
                  controller.saveManualHeight(cmInput.text);
                  Get.back();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------
  //                REUSABLE CHIP WIDGET
  // ---------------------------------------------------------
  Widget _buildOptionChip({required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Text(
          label,
          style: globalTextStyle(fontSize: 13),
        ),
      ),
    );
  }

  Widget _buildCrossBottomShitButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.2),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
          onPressed: () => Get.back(),
        ),
      ),
    );
  }
}