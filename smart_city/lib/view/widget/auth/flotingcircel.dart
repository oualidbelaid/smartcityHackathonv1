import 'package:flutter/material.dart';
import 'package:smart_city/core/constant/appcolor.dart';
import 'package:sizer/sizer.dart';

class Flotingcircel extends StatelessWidget {
  const Flotingcircel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 100.h,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 12.h,
                height: 12.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  gradient: const LinearGradient(
                    colors: [Color(0x6E41AAFF), AppColor.primary],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 8.h,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 20.h,
                height: 20.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1.w,
                  ),
                  gradient: const LinearGradient(
                    colors: [AppColor.primary, AppColor.primary],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
