import 'package:fitnestx/core/const/app_size.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      //home:
    );
  }
}

