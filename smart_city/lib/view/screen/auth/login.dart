import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_city/controller/auth/logincontroller.dart';
import 'package:smart_city/core/class/loadingdata.dart';
import 'package:smart_city/core/class/statusrequest.dart';
import 'package:smart_city/core/constant/appcolor.dart';
import 'package:smart_city/core/constant/appiconsvg.dart';
import 'package:smart_city/core/constant/appimage.dart';
import 'package:smart_city/core/function/alertexitapp.dart';
import 'package:smart_city/core/function/validinput.dart';
import 'package:smart_city/view/widget/auth/alreadycontext.dart';
import 'package:smart_city/view/widget/auth/customtitle.dart';
import 'package:smart_city/view/widget/auth/flotingcircel.dart';
import 'package:smart_city/view/widget/auth/inputfield.dart';
import 'package:smart_city/view/widget/back.dart';
import '../../widget/auth/custombutton.dart';
import '../../widget/auth/orconnect.dart';

class Login extends GetView<LoginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,

      appBar: AppBar(
        toolbarHeight: 8.h,
        // centerTitle: true,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          width: double.infinity,
          alignment:  Alignment.centerLeft,
          height: 8.h,
          child: Image.asset(
            AppImage.logo,
            fit: BoxFit.cover,
          ),
        ),

        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
      ),
      body: WillPopScope(
        onWillPop: () => alertExitApp(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                  left: Get.deviceLocale!.languageCode == "ar" ? -7.w : null,
                  right: Get.deviceLocale!.languageCode != "ar" ? -7.w : null,
                  top: 0,
                  child: const Align(child: Flotingcircel())),
              Positioned(
                child: Align(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 3.h,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.h),
                            child: Customtitle(
                                title: "logintitle".tr,
                                bodyText: "loginbody".tr),
                          ),
                          SizedBox(
                            height: Get.deviceLocale!.languageCode == "ar"
                                ? 5.h
                                : 12.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.h, vertical: 0),
                            child: Form(
                              key: controller.formState,
                              child:
                                  GetBuilder<LoginController>(builder: (cnt) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Inputfield(
                                      valid: (val) {
                                        return validInput(
                                            val!, 10, 100, "email");
                                      },
                                      lable: "email".tr,
                                      hintText: "emailhint".tr,
                                      textEditingController: controller.email,
                                      obscureText: false,
                                      icon: SvgPicture.asset(AppIconSvg.email,
                                          fit: BoxFit.contain,
                                          color: AppColor.textbodyColor),
                                    ),
                                    Inputfield(
                                      valid: (val) {
                                        return validInput(
                                            val!, 8, 40, "password");
                                      },
                                      lable: "password".tr,
                                      hintText: "passwordhint".tr,
                                      textEditingController:
                                          controller.password,
                                      obscureText: controller.obscureText,
                                      onTapIcon: () {
                                        controller.showpassword();
                                      },
                                      icon: SvgPicture.asset(
                                          AppIconSvg.password,
                                          color: controller.obscureText
                                              ? AppColor.textbodyColor
                                              : Colors.blueAccent),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 4.h, vertical: 1.h),
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                print("gooooo");
                                controller.goToPageForgetPassword();
                              },
                              child: Text(
                                "forgotpassword".tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromARGB(255, 40, 108, 235),
                                    fontSize: 9.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 30.w,
                                height: 1,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                color: AppColor.textbodyColor,
                              ),
                              Text(
                                "or".tr,
                                style: const TextStyle(
                                  color: Color(0xffa5acbb),
                                  fontSize: 13,
                                ),
                              ),
                              Container(
                                width: 30.w,
                                height: 1,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                color: AppColor.textbodyColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          const Orconnect(),
                          SizedBox(
                            height: 4.h,
                          ),
                          Custombutton(
                            contextButton: "loginButton",
                            onTap: () {
                              controller.login();
                              controller.loadingPage(context);
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Alreadycontext(
                              alreadycontext: "alreadyCreateAccount",
                              onTap: () => controller.goToPageSingUp(),
                              link: "signupLink")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // GetBuilder<LoginController>(builder: (cnt) {
              //   return Positioned(
              //       child: LoadingData(
              //     statusRequest: controller.statusRequest,
              //   ));
              // }),
            ],
          ),
        ),
      ),
    );
  }
}
