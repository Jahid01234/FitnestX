import 'package:get/get.dart';

class CompareResultController extends GetxController{

  RxInt selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }


}
