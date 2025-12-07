import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBackButton extends StatelessWidget{
  const AppBackButton ({super.key});


  @override
  Widget build (BuildContext context){
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.withValues(alpha: 0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(child: Icon(Icons.arrow_back_ios_rounded,size: 20,))
        ),
      ),
    );
  }
}