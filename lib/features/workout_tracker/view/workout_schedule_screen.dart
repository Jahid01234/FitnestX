import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/workout_tracker/controller/workout_schedule_controller.dart';
import 'package:fitnestx/features/workout_tracker/view/widgets/custom_calendar_title_bar.dart';
import 'package:fitnestx/features/workout_tracker/view/widgets/workout_event_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutScheduleScreen extends StatelessWidget {
  WorkoutScheduleScreen({super.key});

  final WorkoutScheduleController controller = Get.put(
    WorkoutScheduleController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xffC58BF2), Color(0xffEEA4CE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton(
          splashColor: Colors.transparent,
          highlightElevation: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            Get.toNamed(AppRoutes.addSchedule);
          },
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
      ),
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
                    "Workout Schedule",
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

            const SizedBox(height: 24),
            // -------- Calendar Widget ----------
            CustomCalendarTitleBar(controller: controller),
            const SizedBox(height: 20),

            // -------- Timeline View ----------
            Expanded(
              child: Obx(
                    () => Container(
                  //margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(14, (index) {
                        paddingOnly(bottom: 50);
                        final hour = 6 + index;
                        final displayHour = hour > 12 ? hour - 12 : hour;
                        final period = hour >= 12 ? 'PM' : 'AM';

                        // Check if there's an event at this hour
                        final event = controller.getEventForHour(hour);

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Time label
                            Text(
                              "${displayHour.toString().padLeft(2, '0')}:00 $period",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffADA4A5).withValues(alpha: 0.6),
                              ),
                            ),

                            /// Event or empty space
                            Expanded(
                              child: event != null
                                  ? Column(
                                children: [
                                  GestureDetector(
                                        onTap: () {
                                          // Show custom dialog
                                          showDialog(
                                            context: context,
                                            builder: (context) => WorkoutEventDialog(
                                              title: event.title,
                                              time: "${event.startTime} - ${event.endTime}",
                                              onMarkAsDone: () {
                                                controller.markEventAsDone(hour);
                                              },
                                            ),
                                          );
                                        },
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        margin:  const EdgeInsets.only(right: 5),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: event.isDone
                                              ? null
                                              : LinearGradient(
                                            colors: [
                                              const Color(0xffEEA4CE),
                                              const Color(0xffC58BF2),
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          color: event.isDone
                                              ? Colors.grey.withValues(alpha: 0.3)
                                              : null,
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              event.title,
                                              style: globalTextStyle(
                                                color:event.isDone
                                                    ? Colors.black : Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              "${event.startTime} - ${event.endTime}",
                                              style: globalTextStyle(
                                                color: event.isDone
                                                    ? Colors.black :Colors.white.withValues(alpha: 0.7),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (index < 13) Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: const Color(0xffDDDADA).withValues(alpha: 0.6),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                                  : Container(
                                height: 70,
                                decoration: index < 13 ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: const Color(0xffDDDADA).withValues(alpha: 0.6),
                                      width: 1,
                                    ),
                                  ),
                                ) : null,
                              ),
                            ),
                          ],
                        );
                       },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}