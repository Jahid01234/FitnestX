import 'package:fitnestx/core/const/icons_path.dart';
import 'package:fitnestx/features/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController{
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    HomeScreen(),
    Center(child: Text("Activity Page")),
    Center(child: Text("Camera Page")),
    Center(child: Text("Profile Page")),
  ];



  final List<Map<String, String>> navItems = [
    {
      'active': IconsPath.homeAc,
      'inactive': IconsPath.home,
    },
    {
      'active': IconsPath.activityAc,
      'inactive': IconsPath.activity,
    },
    {
      'active': IconsPath.cameraAc,
      'inactive': IconsPath.camera,
    },
    {
      'active': IconsPath.profileAc,
      'inactive': IconsPath.profile,
    },
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}