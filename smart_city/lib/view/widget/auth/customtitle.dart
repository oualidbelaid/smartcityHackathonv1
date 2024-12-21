import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city/core/constant/appcolor.dart';
import 'package:sizer/sizer.dart';

class Customtitle extends StatelessWidget {
  final String title;
  final String bodyText;
  const Customtitle({Key? key, required this.title, required this.bodyText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Get.deviceLocale!.languageCode == "ar"
          ? Alignment.centerRight
          : Alignment.centerLeft,

      // width: 60.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${title.capitalize}",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
                color: Color.fromARGB(171, 0, 0, 0)),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Text(
            "${bodyText.capitalize}",
            textAlign: TextAlign.start,
            style: TextStyle(color: AppColor.textbodyColor, fontSize: 11.sp),
          )
        ],
      ),
    );
  }
}
