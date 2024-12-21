import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_city/controller/onbaordingcontroller.dart';
import 'package:smart_city/view/widget/customflech.dart';

import '../../../core/constant/appcolor.dart';
import 'package:sizer/sizer.dart';

class CustomcircularPains extends StatelessWidget {
  const CustomcircularPains({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: 17.w,
          height: 17.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.w),
              boxShadow:   [
                BoxShadow(
                    blurRadius: 20,
                    offset: Offset(0, 0),
                    color:AppColor.primary.withOpacity(0.2))
              ],
              color: AppColor.primaryColor),
          child: GetBuilder<OnbaordingController>(
            builder: (controller) => InkWell(
              borderRadius: BorderRadius.circular(60.w),
              overlayColor:
                  MaterialStateProperty.all<Color>(AppColor.primaryColor),
              onTap: () {
                controller.next();
              },
              child: Center(
                child: CircularPercentIndicator(
                  radius: 8.5.w,
                  animationDuration: 500,
                  animation: true,
                  animateFromLastPercent: false,
                  addAutomaticKeepAlive: false,
                  restartAnimation: false,
                  lineWidth: 1.w,
                  percent: controller.percent,
                  center: Customflech(),
                  progressColor: const Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: const Color.fromARGB(175, 255, 255, 255),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
