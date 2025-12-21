import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:fitnestx/features/workout_tracker/model/workout_event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class WorkoutScheduleController extends GetxController {
  // Calendar related
  final CalendarAgendaController agendaController = CalendarAgendaController();
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final RxList<DateTime> events = <DateTime>[].obs;
  final RxList<WorkoutEvent> workoutEvents = <WorkoutEvent>[].obs;

  // Add Schedule related
  Rx<DateTime> selectedDateTime = DateTime.now().obs;
  final RxInt selectedHour = 3.obs;
  final RxInt selectedMinute = 30.obs;
  final RxString selectedPeriod = 'PM'.obs;
  final RxString selectedWorkout = 'Upperbody Workout'.obs;
  final RxString selectedDifficulty = 'Beginner'.obs;
  final RxInt customRepetitions = 0.obs;
  final RxInt customWeights = 0.obs;
  RxString difficulty = 'Beginner'.obs;

  @override
  void onInit() {
    super.onInit();
    events.value = List.generate(10, (index) {
      return DateTime.now().add(Duration(days: index));
    });
  }

  // ========== Calendar Methods ==========
  void onDateSelected(DateTime date) {
    selectedDate.value = date;
    selectedDateTime.value = date;
    print('Selected date: $date');
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

  // ========== Workout Event Methods ==========
  // Mark event as done
  void markEventAsDone(int hour) {
    final event = getEventForHour(hour);
    if (event != null) {
      event.isDone = true;
      workoutEvents.refresh(); 
    }
  }

  // Get events for selected date and specific hour
  WorkoutEvent? getEventForHour(int hour) {
    return workoutEvents.firstWhereOrNull(
          (event) =>
      event.dateTime.year == selectedDate.value.year &&
          event.dateTime.month == selectedDate.value.month &&
          event.dateTime.day == selectedDate.value.day &&
          event.dateTime.hour == hour,
    );
  }

  // Add new workout event
  void addWorkoutEvent(WorkoutEvent event) {
    workoutEvents.add(event);

    // Add date to events list if not already present
    final eventDate = DateTime(
      event.dateTime.year,
      event.dateTime.month,
      event.dateTime.day,
    );

    if (!events.any((date) =>
    date.year == eventDate.year &&
        date.month == eventDate.month &&
        date.day == eventDate.day)) {
      events.add(eventDate);
    }

    print('Workout event added: ${event.title} at ${event.startTime}');
  }

  // Delete workout event
  void deleteWorkoutEvent(WorkoutEvent event) {
    workoutEvents.remove(event);
  }

  // Get all events for a specific date
  List<WorkoutEvent> getEventsForDate(DateTime date) {
    return workoutEvents
        .where((event) =>
    event.dateTime.year == date.year &&
        event.dateTime.month == date.month &&
        event.dateTime.day == date.day)
        .toList();
  }

  // ========== Save Schedule Method ==========
  void saveSchedule() {
    // Convert 12-hour format to 24-hour format
    int hour24 = selectedHour.value;
    if (selectedPeriod.value == 'PM' && selectedHour.value != 12) {
      hour24 = selectedHour.value + 12;
    } else if (selectedPeriod.value == 'AM' && selectedHour.value == 12) {
      hour24 = 0;
    }

    // Create DateTime with selected date and time
    final scheduleDateTime = DateTime(
      selectedDateTime.value.year,
      selectedDateTime.value.month,
      selectedDateTime.value.day,
      hour24,
      selectedMinute.value,
    );

    // Calculate duration (default 1 hour)
    double duration = 1.0;
    if (customRepetitions.value > 0) {
      duration = (customRepetitions.value / 50).clamp(0.5, 3.0);
    }

    // Format time strings
    final startTime = _formatTime(scheduleDateTime);
    final endDateTime =
    scheduleDateTime.add(Duration(minutes: (duration * 60).toInt()));
    final endTime = _formatTime(endDateTime);

    // Create workout event
    final workoutEvent = WorkoutEvent(
      title: selectedWorkout.value,
      dateTime: scheduleDateTime,
      duration: duration,
      isBlue: _getWorkoutColor(),
      startTime: startTime,
      endTime: endTime,
      difficulty: selectedDifficulty.value,
      repetitions: customRepetitions.value,
      weights: customWeights.value,
    );

    // Add event
    addWorkoutEvent(workoutEvent);

    // Update selectedDate to match the scheduled date
    selectedDate.value = DateTime(
      scheduleDateTime.year,
      scheduleDateTime.month,
      scheduleDateTime.day,
    );

    // Reset form values
    resetScheduleForm();

    // Navigate back
    Get.back();

    // Show success message
    Get.snackbar(
      'Success',
      'Workout scheduled successfully!',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      backgroundColor: const Color(0xff92A3FD),
      colorText: Colors.white,
    );
  }

  String _formatTime(DateTime time) {
    final hour = time.hour > 12 ? time.hour - 12 : time.hour;
    final period = time.hour >= 12 ? 'PM' : 'AM';
    final minute = time.minute.toString().padLeft(2, '0');
    return '${hour == 0 ? 12 : hour}:$minute $period';
  }

  bool _getWorkoutColor() {
    // Alternate colors based on workout type
    final blueWorkouts = [
      'Upperbody Workout',
      'Cardio Workout',
      'HIIT Workout'
    ];
    return blueWorkouts.contains(selectedWorkout.value);
  }

  void resetScheduleForm() {
    selectedDateTime.value = DateTime.now();
    selectedHour.value = 3;
    selectedMinute.value = 30;
    selectedPeriod.value = 'PM';
    selectedWorkout.value = 'Upperbody Workout';
    selectedDifficulty.value = 'Beginner';
    customRepetitions.value = 0;
    customWeights.value = 0;
  }

  // ========== Date Picker ==========
  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTime.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(3000),
    );

    if (picked != null) {
      selectedDateTime.value = picked;
    }
  }

  String get formattedDate =>
      DateFormat('EEE, dd MMM yyyy').format(selectedDateTime.value);

  // ========== Difficulty Bottom Sheet ==========
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
        selectedDifficulty.value = value;
        Get.back();
      },
    );
  }
}