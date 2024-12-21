import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city/controller/onbaordingcontroller.dart';
import 'package:smart_city/core/constant/appcolor.dart';
import 'package:smart_city/view/widget/back.dart';
import 'package:smart_city/view/widget/onbaording/customcircularPains.dart';
import 'package:smart_city/view/widget/onbaording/customslide.dart';
import 'package:smart_city'
    '/view/widget/onbaording/dotcontroller.dart';
import 'package:sizer/sizer.dart';

class Onbaording extends GetView<OnbaordingController> {
  const Onbaording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          toolbarHeight: 8.h,
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              margin: EdgeInsets.only(
                  top: 6,
                  bottom: 7,
                  right: 4.w,
                  left: Get.deviceLocale!.languageCode == "ar" ? 10 : 0),
              // height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.w),
                color: const Color.fromARGB(14, 255, 170, 0),
              ),
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color?>(
                     AppColor.primary), 
                  elevation: MaterialStateProperty.all<double?>(0),
                ),
                child: Text(
                  'skip'.tr.capitalize!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 10.sp),
                ),
                onPressed: () {
                  controller.skip();
                },
              ),
            ),
          ],
          leading: GetBuilder<OnbaordingController>(
            builder: (controller) => Back(
                incrm: controller.incrm,
                onclick: () {
                  controller.back();
                }),
          ),
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Expanded(flex: 8, child: CustomSlide()),
            Expanded(flex: 1, child: Dotcontroller()),
            Expanded(flex: 2, child: CustomcircularPains()),
          ],
        ));
  }
}
