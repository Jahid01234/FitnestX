import 'package:fitnestx/features/auth/goal/model/goal_model.dart';
import 'package:get/get.dart';

class GoalController extends GetxController{
  RxList goalPage = <GoalModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadGoalPage();
  }


  void loadGoalPage(){
    goalPage.addAll(goalItemsListData);
  }
}