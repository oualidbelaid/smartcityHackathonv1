import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

alertExitApp() {
  Get.defaultDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('cancel'.tr)),
            SizedBox(
              width: 2.w,
            ),
            TextButton(
                onPressed: () {
                  exit(0);
                },
                child: Text(
                  'exitconfirm'.tr,
                  style: TextStyle(color: Colors.red),
                )),
          ],
        )
      ],
      title: "exittitle".tr,
      middleText: "exitbody".tr,
      middleTextStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
      titleStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      radius: 1.w);
  return Future.value(true);
}
