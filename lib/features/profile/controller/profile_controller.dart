import 'package:get/get.dart';

class ProfileController extends GetxController{
  // Pop-up notification toggle
  RxBool popupNotification = true.obs;

  // Example dynamic list (future expandable)
  RxDouble height = 180.0.obs;
  RxDouble weight = 65.0.obs;
  RxInt age = 22.obs;

  void togglePopup(bool value) {
    popupNotification.value = value;
  }
}