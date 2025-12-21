import 'package:fitnestx/core/const/icons_path.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/global_widgets/app_primary_button.dart';
import 'package:fitnestx/features/workout_tracker/controller/workout_schedule_controller.dart';
import 'package:fitnestx/features/workout_tracker/view/widgets/option_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:intl/intl.dart';

class AddScheduleScreen extends StatelessWidget {
  AddScheduleScreen({super.key});

  final WorkoutScheduleController controller = Get.put(WorkoutScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
        
            // -------- App Bar ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppBackButton(),
                  Text(
                    "Add Schedule",
                    style: globalTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff1D1617),
                    ),
                  ),
                  AppBackButton(icon: Icons.more_horiz, onTap: () {}),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date Section
                    Obx(
                      () => GestureDetector(
                        onTap: () => pickDate(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffF7F8F8),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                               Image.asset(IconsPath.calendar,height: 24),
                              const SizedBox(width: 12),
                              Text(
                                formattedDate,
                                style: globalTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffADA4A5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
        
                    const SizedBox(height: 24),
        
                    // Time Section
                    Text(
                      'Time',
                      style: globalTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff1D1617),
                      ),
                    ),
                    const SizedBox(height: 16),
        
                    // Time Picker
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => pickHour(context),
                            child: _buildTimeSelector(
                              controller.selectedHour.value.toString(),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            ':',
                            style: globalTextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () => pickMinute(context),
                            child: _buildTimeSelector(
                              controller.selectedMinute.value.toString().padLeft(
                                2,
                                '0',
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: () => pickPeriod(context),
                            child: _buildTimeSelector(
                              controller.selectedPeriod.value,
                            ),
                          ),
                        ],
                      ),
                    ),
        
                    const SizedBox(height: 32),
        
                    // Details Workout Section
                    Text(
                      'Details Workout',
                      style: globalTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff1D1617),
                      ),
                    ),
                    const SizedBox(height: 16),
        
                    // Choose Workout
                    Obx(
                      () => OptionTile(
                        icon: IconsPath.barbelIcon,
                        title: 'Choose Workout',
                        subtitle: controller.selectedWorkout.value,
                        onTap: () => pickWorkout(context),
                      ),
                    ),
        
                    const SizedBox(height: 12),
        
                    // Difficulty
                    Obx(
                      () => OptionTile(
                        icon: IconsPath.height,
                        title: 'Difficulty',
                        subtitle: controller.selectedDifficulty.value,
                        onTap: () => pickDifficulty(context),
                      ),
                    ),
        
                    const SizedBox(height: 12),
        
                    // Custom Repetitions
                    Obx(
                      () => OptionTile(
                        icon: IconsPath.chartIcon,
                        title: 'Custom Repetitions',
                        subtitle: controller.customRepetitions.value > 0
                            ? '${controller.customRepetitions.value} reps'
                            : null,
                        onTap: () => pickRepetitions(context),
                      ),
                    ),
        
                    const SizedBox(height: 12),
        
                    // Custom Weights
                    Obx(
                      () => OptionTile(
                        icon: IconsPath.chartIcon,
                        title: 'Custom Weights',
                        subtitle: controller.customWeights.value > 0
                            ? '${controller.customWeights.value} kg'
                            : null,
                        onTap: () => pickWeights(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        
            // Save Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: AppPrimaryButton(
                text: "Save",
                textColor: Colors.white,
                onTap: () {
                  controller.saveSchedule();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSelector(String value) {
    return Container(
      width: value.length > 2 ? 70 : 60,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xffF7F8F8),
        borderRadius: BorderRadius.circular(14),
      ),
      alignment: Alignment.center,
      child: Text(
        value,
        style: globalTextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }



  // Date Picker.........
  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDateTime.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(3000),
    );

    if (picked != null) {
      controller.selectedDateTime.value = picked;
    }
  }

  String get formattedDate => DateFormat('EEE, dd MMM yyyy').format(controller.selectedDateTime.value);


  // Time Picker Methods..........................
  void pickHour(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: 300,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Select Hour',
              style: globalTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color(0xff1D1617),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  final hour = index + 1;
                  return Obx(
                    () => ListTile(
                      title: Text(
                        hour.toString(),
                        textAlign: TextAlign.center,
                        style: globalTextStyle(
                          fontSize: 16,
                          fontWeight: controller.selectedHour.value == hour
                              ? FontWeight.w700
                              : FontWeight.w400,
                          color: controller.selectedHour.value == hour
                              ? const Color(0xff92A3FD)
                              : const Color(0xff1D1617),
                        ),
                      ),
                      onTap: () {
                        controller.selectedHour.value = hour;
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // minute Picker Methods..........................
  void pickMinute(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: 300,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Select Minute',
              style: globalTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color(0xff1D1617),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 60,
                itemBuilder: (context, index) {
                  return Obx(
                    () => ListTile(
                      title: Text(
                        index.toString().padLeft(2, '0'),
                        textAlign: TextAlign.center,
                        style: globalTextStyle(
                          fontSize: 16,
                          fontWeight: controller.selectedMinute.value == index
                              ? FontWeight.w700
                              : FontWeight.w400,
                          color: controller.selectedMinute.value == index
                              ? const Color(0xff92A3FD)
                              : const Color(0xff1D1617),
                        ),
                      ),
                      onTap: () {
                        controller.selectedMinute.value = index;
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Period Picker Methods..........................
  void pickPeriod(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: 200,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Select Period',
              style: globalTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color(0xff1D1617),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => Column(
                children: [
                  ListTile(
                    title: Text(
                      'AM',
                      textAlign: TextAlign.center,
                      style: globalTextStyle(
                        fontSize: 15,
                        fontWeight: controller.selectedPeriod.value == 'AM'
                            ? FontWeight.w500
                            : FontWeight.w400,
                        color: controller.selectedPeriod.value == 'AM'
                            ? const Color(0xff92A3FD)
                            : const Color(0xff1D1617),
                      ),
                    ),
                    onTap: () {
                      controller.selectedPeriod.value = 'AM';
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'PM',
                      textAlign: TextAlign.center,
                      style: globalTextStyle(
                        fontSize: 15,
                        fontWeight: controller.selectedPeriod.value == 'PM'
                            ? FontWeight.w500
                            : FontWeight.w400,
                        color: controller.selectedPeriod.value == 'PM'
                            ? const Color(0xff92A3FD)
                            : const Color(0xff1D1617),
                      ),
                    ),
                    onTap: () {
                      controller.selectedPeriod.value = 'PM';
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Workout Picker..................
  void pickWorkout(BuildContext context) {
    final workouts = [
      'Upperbody Workout',
      'Lowerbody Workout',
      'Fullbody Workout',
      'Cardio Workout',
      'HIIT Workout',
      'Strength Training',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: 400,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: [
            Text(
              'Choose Workout',
              style: globalTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color(0xff1D1617),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: workouts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      workouts[index],
                      textAlign: TextAlign.center,
                      style: globalTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff1D1617),
                      ),
                    ),
                    onTap: () {
                      controller.selectedWorkout.value = workouts[index];
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Difficulty Picker....................
  void pickDifficulty(BuildContext context) {
    final difficulties = ['Beginner', 'Intermediate', 'Advanced'];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: 250,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Select Difficulty',
                style: globalTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff1D1617),
                ),
              ),
              const SizedBox(height: 6),
              ...difficulties.map((difficulty) {
                return ListTile(
                  title: Text(
                    difficulty,
                    textAlign: TextAlign.center,
                    style: globalTextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff1D1617),
                    ),
                  ),
                  onTap: () {
                    controller.selectedDifficulty.value = difficulty;
                    Navigator.pop(context);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Custom Repetitions Picker...............
  void pickRepetitions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: 400,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: [
            Text(
              'Custom Repetitions',
              style: globalTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color(0xff1D1617),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  final reps = (index + 1) * 5;
                  return ListTile(
                    title: Text(
                      '$reps reps',
                      textAlign: TextAlign.center,
                      style: globalTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff1D1617),
                      ),
                    ),
                    onTap: () {
                      controller.customRepetitions.value = reps;
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom Weights Picker.........
  void pickWeights(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: 400,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: [
            Text(
              'Custom Weights',
              style: globalTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color(0xff1D1617),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 40,
                itemBuilder: (context, index) {
                  final weight = (index + 1) * 5;
                  return ListTile(
                    title: Text(
                      '$weight kg',
                      textAlign: TextAlign.center,
                      style: globalTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff1D1617),
                      ),
                    ),
                    onTap: () {
                      controller.customWeights.value = weight;
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
