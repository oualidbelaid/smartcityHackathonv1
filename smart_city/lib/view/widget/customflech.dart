import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smart_city/core/constant/appiconsvg.dart';
import 'package:sizer/sizer.dart';

class Customflech extends StatelessWidget {
  const Customflech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: Get.deviceLocale!.languageCode == "ar" ? 3.141592653589793 : 0,
        child: SvgPicture.asset(
          AppIconSvg.flesh,
          fit: BoxFit.contain,
          height: 6.w,
        ));
  }
}
