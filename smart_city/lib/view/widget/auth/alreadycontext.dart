import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_city/core/constant/appcolor.dart';

class Alreadycontext extends StatelessWidget {
  final String alreadycontext;
  final String link;
  final void Function() onTap;
  const Alreadycontext(
      {Key? key,
      required this.alreadycontext,
      required this.onTap,
      required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.5.h),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(alreadycontext.tr, style: TextStyle(fontSize: 10.sp)),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
            onTap: onTap,
            child: Text(
              link.tr,
              style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600),
            ))
      ]),
    );
  }
}
