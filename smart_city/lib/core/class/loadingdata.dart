import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smart_city/core/class/statusrequest.dart';
import 'package:smart_city/core/class/statusrequest.dart';
import 'package:smart_city/core/constant/appcolor.dart';
import 'package:sizer/sizer.dart';

class LoadingData extends StatelessWidget {
  final StatusRequest? statusRequest;

  const LoadingData({
    Key? key,
    this.statusRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          alignment: Alignment.center,
          child: LoadingAnimationWidget.fourRotatingDots(
            size: 20.w,
            color: AppColor.primaryColor,
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
