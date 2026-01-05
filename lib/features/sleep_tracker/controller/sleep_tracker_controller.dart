import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:fitnestx/features/sleep_tracker/model/sleep_reminder_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SleepTrackerController extends GetxController{
  RxList<SleepReminderModel> remindersList = <SleepReminderModel>[].obs;
  final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final List<double> chartData = [4, 6, 5, 7, 6, 8, 9];
  RxInt selectedDayIndex = 4.obs;

  final CalendarAgendaController agendaController = CalendarAgendaController();
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> selectedDateTime = DateTime.now().obs;
  final RxList<DateTime> events = <DateTime>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadReminderData();
  }

  void loadReminderData(){
    remindersList.value =  sleepReminderData;
  }

  double get selectedValue => chartData[selectedDayIndex.value];

  void selectDay(int index) {
    selectedDayIndex.value = index;
  }

  void toggleReminder(int index, bool value) {
    remindersList[index].isEnabled = value;
    remindersList.refresh();
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