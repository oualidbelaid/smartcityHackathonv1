import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city/controller/onbaordingcontroller.dart';
import 'package:smart_city/core/constant/appcolor.dart';
import 'package:sizer/sizer.dart';

import '../../../data/source/static/onbairdinglist.dart';

class Dotcontroller extends StatelessWidget {
  const Dotcontroller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: (onbaordingList.length * 2.w) + 4.w,
        child: GetBuilder<OnbaordingController>(
          builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(onbaordingList.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: index == controller.incrm ? 6.w : 1.w,
                  height: 1.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.primaryColor),
                );
              }),
            );
          },
        ));
  }
}
