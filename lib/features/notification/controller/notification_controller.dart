import 'package:fitnestx/features/notification/model/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  RxList<NotificationModel> notificationList = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  void loadNotifications(){
    notificationList.value = notificationDataList;
  }


  void clearAllNotifications() {
    notificationList.clear();
  }

  void deleteSingleNotification(int index) {
    notificationList.removeAt(index);
  }
}