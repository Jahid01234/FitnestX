// import 'package:fitnestx/core/const/app_colors.dart';
// import 'package:fitnestx/core/const/app_size.dart';
// import 'package:fitnestx/core/const/icons_path.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class AppBackButton extends StatelessWidget{
//   const AppBackButton ({super.key});
//
//
//   @override
//   Widget build (BuildContext context){
//     return GestureDetector(
//       onTap: (){
//         Get.back();
//       },
//       child: Container(
//         height: getHeight(50),
//         width: getWidth(50),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: AppColors.lightGreenColor.withValues(alpha: 0.2),
//           //color: Colors.black54.withValues(alpha: 0.90)
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Image.asset(IconsPath.bgMessageIcon,height: 20,color:Colors.white54),
//         ),
//       ),
//     );
//   }
// }