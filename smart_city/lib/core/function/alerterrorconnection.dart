import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

alertErrorConnection() {
  Get.defaultDialog(
      title: "warning".tr,
      middleText: "connectionerror".tr,
      titleStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      radius: 1.w);
}
