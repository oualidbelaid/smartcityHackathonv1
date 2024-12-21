import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city/core/constant/appcolor.dart';
import 'package:sizer/sizer.dart';

class Inputfield extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String lable;
  final bool obscureText;
  final String hintText;
  final Widget icon;
  final void Function()? onTapIcon;
  final String? Function(String?)? valid;
  const Inputfield(
      {Key? key,
      required this.lable,
      required this.hintText,
      required this.textEditingController,
      required this.obscureText,
      required this.icon,
      this.valid,
      this.onTapIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Text(
              "${lable.capitalize}",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10.sp),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 1.h),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  offset: const Offset(0, 0),
                  blurRadius: 20,
                ),
              ],
              borderRadius: BorderRadius.circular(3.w),
            ),
            child: TextFormField(
              validator: valid,
              obscureText: obscureText,
              controller: textEditingController,
              style: TextStyle(
                color: const Color.fromARGB(255, 59, 59, 59),
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
              ),
              cursorColor: const Color.fromARGB(31, 102, 102, 102),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  focusColor: AppColor.primary,
                  suffixIconColor: AppColor.primary,
                  suffixIcon: GestureDetector(
                    onTap: onTapIcon,
                    child: Container(
                        width: 9.w,
                        height: 9.w,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(2.h),
                        child: icon),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.w),
                      borderSide: const BorderSide(width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.w),
                      borderSide: const BorderSide(
                          width: 1, color: AppColor.primary)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.5.w),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.w),
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromARGB(175, 212, 212, 212))),
                  hintText: '${hintText.capitalize}',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 8.sp,
                      color: AppColor.hintColor)),
            ),
          ),
        ],
      ),
    );
  }
}
