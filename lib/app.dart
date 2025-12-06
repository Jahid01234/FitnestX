import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/app_size.dart';
import 'package:fitnestx/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FitnestXApp extends StatelessWidget {
  const FitnestXApp({super.key});


  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return GetMaterialApp(
      title: 'FitnestX App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         scaffoldBackgroundColor: AppColors.white
      ),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes
    );
  }
}

