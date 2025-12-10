import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/global_widgets/app_back_button.dart';
import 'package:fitnestx/core/global_widgets/custom_alert_dialog.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationController controller =
  Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBackButton(),
                  Text(
                    "Notification",
                    style: globalTextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => CustomAlertDialog(
                          title: "Delete Notification",
                          description: "Are you sure delete all notification history?",
                          onConfirm: () {
                            controller.clearAllNotifications();
                            Navigator.pop(context);
                          },
                          onCancel: () => Navigator.pop(context),
                        ),
                      );
                    },
                  ),
                ],
              ),

               SizedBox(height: getHeight(40)),

              /// 🔥 Notification List
              Expanded(
                child: Obx(() {
                  return ListView.separated(
                    itemCount: controller.notificationList.length,
                    separatorBuilder: (_, __) =>
                        Divider(color: Colors.grey.shade300),

                    itemBuilder: (context, index) {
                      final item = controller.notificationList[index];

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          /// Image
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                item.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: globalTextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item.timeAgo,
                                  style: globalTextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// 3-dot menu
                          IconButton(
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => CustomAlertDialog(
                                  title: "Delete Notification",
                                  description: "Are you sure delete this notification?",
                                  onConfirm: () {
                                    controller.deleteSingleNotification(index);
                                    Navigator.pop(context);
                                  },
                                  onCancel: () => Navigator.pop(context),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
