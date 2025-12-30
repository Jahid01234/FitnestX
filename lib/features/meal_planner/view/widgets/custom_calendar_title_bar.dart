import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:fitnestx/features/meal_planner/controller/meal_schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCalendarTitleBar extends StatelessWidget {
  final MealScheduleController controller;

  const  CustomCalendarTitleBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: controller.goToPreviousWeek,
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.grey,
                  size: 28,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              Text(
                controller.getMonthYear(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: controller.goToNextWeek,
                icon: const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                  size: 28,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
           ),
          ),

          // Calendar
          CalendarAgenda(
            controller: controller.agendaController,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 140)),
            lastDate: DateTime.now().add(const Duration(days: 140)),
            onDateSelected: (date) => controller.onDateSelected(date),
            backgroundColor: Colors.transparent,
            selectedDateColor: const Color(0xff92A3FD),
            dateColor: const Color(0xff1D1617),
            calendarBackground: Colors.transparent,
            calendarEventSelectedColor: Colors.white,
            calendarEventColor: const Color(0xff92A3FD),
            locale: 'en',
            appbar: false,
            events: controller.events,
            fullCalendar: false,
            weekDay: WeekDay.short,
            selectedDayPosition: SelectedDayPosition.center,
          ),
        ],
      ),
    );
  }
}
