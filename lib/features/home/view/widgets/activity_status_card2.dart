import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitnestx/core/const/app_colors.dart';
import 'package:fitnestx/core/const/images_path.dart';
import 'package:fitnestx/core/style/global_text_style.dart';
import 'package:fitnestx/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ActivityStatusCard2 extends StatelessWidget {
   ActivityStatusCard2({super.key});


  final HomeController controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: media.width * 1,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 16,
                  spreadRadius: 0,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Row(
              children: [
                SimpleAnimationProgressBar(
                  height: media.width * 0.85,
                  width: media.width * 0.07,
                  backgroundColor: Colors.grey.shade100,
                  foregroundColor: Colors.purple,
                  ratio: 0.5,
                  direction: Axis.vertical,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(seconds: 3),
                  borderRadius: BorderRadius.circular(15),
                  gradientColor: LinearGradient(
                    colors: [AppColors.primaryColor1, AppColors.primaryColor2],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Water Intake",
                        style: globalTextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            colors: [
                              AppColors.primaryColor1,
                              AppColors.primaryColor2,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(
                            Rect.fromLTRB(0, 0, bounds.width, bounds.height),
                          );
                        },
                        child: Text(
                          "4 Liters",
                          style: globalTextStyle(
                            color: AppColors.white.withValues(alpha: 0.7),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Real time updates",
                        style: globalTextStyle(
                          color: AppColors.gray,
                          fontSize: 12,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.waterArr.map((wObj) {
                          var isLast = wObj == controller.waterArr.last;
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: AppColors.secondaryColor1
                                          .withValues(alpha: 0.5),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  if (!isLast)
                                    DottedDashedLine(
                                      height: media.width * 0.078,
                                      width: 0,
                                      dashColor: AppColors.secondaryColor1
                                          .withValues(alpha: 0.5),
                                      axis: Axis.vertical,
                                    ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    wObj["title"].toString(),
                                    style: globalTextStyle(
                                      color: AppColors.gray,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    wObj["subtitle"].toString(),
                                    style: globalTextStyle(
                                      color: AppColors.secondaryColor1
                                          .withValues(alpha: 0.5),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: media.width * 0.05),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.maxFinite,
                height: media.width * 0.49,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 16,
                      spreadRadius: 0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sleep",
                      style: globalTextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: [
                            AppColors.primaryColor1,
                            AppColors.primaryColor2,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(
                          Rect.fromLTRB(0, 0, bounds.width, bounds.height),
                        );
                      },
                      child: Text(
                        "8h 20m",
                        style: globalTextStyle(
                          color: AppColors.white.withValues(alpha: 0.7),
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Image.asset(ImagePath.sleepGraph),
                  ],
                ),
              ),
              SizedBox(height: media.width * 0.05),
              Container(
                width: double.maxFinite,
                height: media.width * 0.45,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 16,
                      spreadRadius: 0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Calories",
                      style: globalTextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: [
                            AppColors.primaryColor1,
                            AppColors.primaryColor2,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(
                          Rect.fromLTRB(0, 0, bounds.width, bounds.height),
                        );
                      },
                      child: Text(
                        "760 kCal",
                        style: globalTextStyle(
                          color: AppColors.white.withValues(alpha: 0.7),
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: media.width * 0.2,
                        height: media.width * 0.2,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: media.width * 0.15,
                              height: media.width * 0.15,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: AppColors.appGradient1,
                                borderRadius: BorderRadius.circular(
                                  media.width * 0.075,
                                ),
                              ),
                              child: FittedBox(
                                child: Text(
                                  "230kCal\nleft",
                                  textAlign: TextAlign.center,
                                  style: globalTextStyle(
                                    color: AppColors.white,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                            SimpleCircularProgressBar(
                              progressStrokeWidth: 10,
                              backStrokeWidth: 10,
                              progressColors: [
                                AppColors.primaryColor1,
                                AppColors.primaryColor2,
                              ],
                              backColor: Colors.grey.shade100,
                              valueNotifier: ValueNotifier(50),
                              startAngle: -180,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
