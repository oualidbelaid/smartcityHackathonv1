import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city/controller/onbaordingcontroller.dart';
import 'package:smart_city/core/constant/appcolor.dart';
import 'package:sizer/sizer.dart';

import '../../../data/source/static/onbairdinglist.dart';

class CustomSlide extends StatelessWidget {
  const CustomSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnbaordingController onbaordingController = Get.put(OnbaordingController());
    return PageView.builder(
      itemCount: onbaordingList.length,
      controller: onbaordingController.pageController,
      onPageChanged: (index) {
        onbaordingController.onchange(index);
      },
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 3,
              child: Text("${onbaordingList[index].title?.capitalize}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColor.primaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700)),
            ),
            Expanded(
              flex: 8,
              child: Image.asset(
                '${onbaordingList[index].image}',
                width: 70.w,
                height: 76.h,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(top: 5.h),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  "${onbaordingList[index].body?.capitalize}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Color.fromARGB(255, 70, 70, 70), fontSize: 12.sp),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
