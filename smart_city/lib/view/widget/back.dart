import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smart_city/core/constant/appiconsvg.dart';
import 'package:sizer/sizer.dart';

class Back extends StatelessWidget {
  final int incrm;
  final void Function() onclick;
  const Back({Key? key, required this.onclick, required this.incrm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onclick,
        child: incrm == 0
            ? null
            : Container(
                width: 11.w,
                height: 11.w,
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: 10,
                    right: Get.deviceLocale!.languageCode == "ar" ? 10 : 0),
                padding: EdgeInsets.all(1.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.w),
                  color: const Color(0xffF3F8FE),
                ),
                child: Transform.rotate(
                  angle: Get.deviceLocale!.languageCode == "ar"
                      ? 3.141592653589793
                      : 0,
                  child: SvgPicture.asset(
                    AppIconSvg.back,
                    width: 8.h,
                    height: 4.w,
                  ),
                )),
      ),
    );
  }
}
