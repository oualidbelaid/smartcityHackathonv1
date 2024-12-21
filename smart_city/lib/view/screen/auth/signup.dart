import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smart_city/controller/auth/signupcontroller.dart';
import 'package:smart_city/core/constant/appimage.dart';
import 'package:smart_city/core/function/validinput.dart';
import 'package:smart_city/view/widget/auth/alreadycontext.dart';
import 'package:smart_city/view/widget/auth/customtitle.dart';
import 'package:smart_city/view/widget/auth/flotingcircel.dart';
import 'package:smart_city/view/widget/auth/inputfield.dart';
import 'package:smart_city/view/widget/back.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_city/core/constant/AppIconSvg.dart';
import '../../../controller/auth/signupcontroller.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/appcolor.dart';
import '../../../core/function/validinput.dart';
import '../../widget/auth/custombutton.dart';
import '../../widget/auth/customtitle.dart';
import '../../widget/auth/flotingcircel.dart';
import '../../widget/auth/inputfield.dart';

class SignUp extends GetView<SignUpController> {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false, // Important for avoiding overflow when keyboard appears
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 8.h,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          alignment: Get.deviceLocale!.languageCode == 'ar'
              ? Alignment.centerLeft
              : Alignment.centerRight,
          height: 7.h,
          child: Image.asset(
            AppImage.logo,
            fit: BoxFit.cover,
          ),
        ),
        leading: Back(
            incrm: 1,
            onclick: () {
              controller.back();
            }),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(), // Makes scrolling smoother
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
                left: Get.deviceLocale!.languageCode == "ar" ? -7.w : null,
                right: Get.deviceLocale!.languageCode != "ar" ? -7.w : null,
                top: 0,
                child: const Align(child: Flotingcircel())),
            Positioned(
              child: Align(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.h),
                          child: Customtitle(
                              title: "signuptitle".tr,
                              bodyText: "signupbody".tr),
                        ),
                        SizedBox(
                          height: Get.deviceLocale!.languageCode == "ar"
                              ? 5.h
                              : 12.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.h, vertical: 0),
                          child: Form(
                            key: controller.formState,
                            child: GetBuilder<SignUpController>(builder: (cnt) {
                              return Column(
                                children: [
                                  Inputfield(
                                    valid: (val) {
                                      return validInput(
                                          val!, 8, 20, "username");
                                    },
                                    lable: "username".tr,
                                    hintText: "usernamehint".tr,
                                    textEditingController: controller.username,
                                    icon: SvgPicture.asset(AppIconSvg.user,
                                        color: AppColor.textbodyColor),
                                    obscureText: false,
                                  ),
                                  Inputfield(
                                    valid: (val) {
                                      return validInput(val!, 10, 100, "email");
                                    },
                                    lable: "email".tr,
                                    hintText: "emailhint".tr,
                                    textEditingController: controller.email,
                                    obscureText: false,
                                    icon: SvgPicture.asset(AppIconSvg.email,
                                        color: AppColor.textbodyColor),
                                  ),
                                  Inputfield(
                                    valid: (val) {
                                      return validInput(
                                          val!, 8, 40, "password");
                                    },
                                    onTapIcon: () {
                                      controller.showpassword();
                                    },
                                    lable: "password".tr,
                                    hintText: "passwordhint".tr,
                                    textEditingController: controller.password,
                                    obscureText: controller.obscureText,
                                    icon: SvgPicture.asset(AppIconSvg.password,
                                        color: controller.obscureText
                                            ? AppColor.textbodyColor
                                            : Colors.blueAccent),
                                  ),
                                  Inputfield(
                                    valid: (val) {
                                      if (controller.password?.text != val) {
                                        return "errorpassconfire".tr;
                                      }
                                      return validInput(
                                          val!, 8, 40, "password");
                                    },
                                    lable: "confirmPassword".tr,
                                    hintText: "confirmPasswordHint".tr,
                                    textEditingController:
                                    controller.passwordConfirm,
                                    obscureText: controller.obscureText,
                                    icon: SvgPicture.asset(
                                        AppIconSvg.passwordConfirm,
                                        color: AppColor.textbodyColor),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                        SizedBox(
                          height: 2.6.h,
                        ),
                        // Show loading indicator conditionally
                        GetBuilder<SignUpController>(
                          builder: (controller) {
                            return controller.statusRequest == StatusRequest.loading
                                ? const CircularProgressIndicator(color: AppColor.primaryColor,)
                                : Custombutton(
                              contextButton: "signupNext",
                              onTap: () {
                                controller.next();
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Alreadycontext(
                            alreadycontext: "alreadyHaveAccount".tr,
                            onTap: () {
                              controller.back();
                            },
                            link: "loginLink".tr)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}