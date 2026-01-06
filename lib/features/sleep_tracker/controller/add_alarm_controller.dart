import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddAlarmController extends GetxController{
  RxBool reminder = true.obs;
  Rx<DateTime> bedtime = DateTime.now().obs;
  RxInt sleepMinutes = (8 * 60 + 30).obs;

  RxInt tempHour = 8.obs;
  RxInt tempMinute = 30.obs;


  RxList<String> repeatDays =
      ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'].obs;

  final allDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  String get formattedBedtime =>
      DateFormat('hh:mm a').format(bedtime.value);

  String get formattedSleepHours {
    final h = sleepMinutes.value ~/ 60;
    final m = sleepMinutes.value % 60;
    return '${h}h ${m}m';
  }

  String get formattedRepeat =>
      repeatDays.length == 7 ? 'Everyday' : repeatDays.join(', ');

  void toggleReminder(bool value) {
     reminder.value = value;
  }

}