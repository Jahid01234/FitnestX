import 'package:fitnestx/features/progress_tracker/model/gallery_model.dart';
import 'package:get/get.dart';

class ProgressTrackerController extends GetxController{
  RxList<GallerySectionModel> gallerySectionDataList = <GallerySectionModel>[].obs;
  RxString selectedMonth1 = 'Select Month 1'.obs;
  RxString selectedMonth2 = 'Select Month 2'.obs;

  @override
  void onInit() {
    super.onInit();
    loadGallerySectionData();
  }

  void loadGallerySectionData(){
    gallerySectionDataList.value =  gallerySectionsData;
  }


  // Month list
  final List<String> months = [
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

}
