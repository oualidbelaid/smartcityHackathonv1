import 'package:flutter/material.dart';
import 'package:smart_city/core/constant/appcolor.dart';
import 'package:smart_city/view/widget/customflech.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Custombutton extends StatelessWidget {
  final String contextButton;
  final void Function() onTap;

  const Custombutton(
      {Key? key, required this.contextButton, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
      child: Container(
        margin: EdgeInsets.only(top: 2.h),
        width: 52.w,
        height: 6.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            const BoxShadow(
              color: AppColor.primary,
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Color.fromARGB(255, 143, 243,
                168), backgroundColor: AppColor.primary, disabledForegroundColor:AppColor.primary.withOpacity(0.38), disabledBackgroundColor: Color.fromARGB(255, 0, 255,
                21).withOpacity(0.12), //specify the button's disabled text, icon, and fill color
            shadowColor:
                const Color(0x892cc653), //specify the button's elevation color
            elevation: 3.0,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    20)), // set the buttons shape. Make its birders rounded etc
            enabledMouseCursor:
                MouseCursor.defer, //used to construct ButtonStyle.mouseCursor
            disabledMouseCursor: MouseCursor
                .uncontrolled, //used to construct ButtonStyle.mouseCursor
            visualDensity: VisualDensity(
                horizontal: 0.0,
                vertical: 0.0), //set the button's visual density
            tapTargetSize: MaterialTapTargetSize
                .padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
            animationDuration:
                Duration(milliseconds: 100), //the buttons animations duration
            enableFeedback: true, //to set the feedback to true or false
            alignment:
                Alignment.bottomCenter, //set the button's child Alignment
          ),
          onPressed: onTap,
          // color: const Color(0xff2dc653),
          // splashColor: Color.fromARGB(255, 109, 233, 140),
          // elevation: 0,
          // focusElevation: 6,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$contextButton".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 14),
                Container(
                  width: 5.5.w,
                  height: 5.5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Customflech(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
