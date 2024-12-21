import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_city/core/class/statusrequest.dart';
import 'package:smart_city/core/constant/approutes.dart';
import 'package:smart_city/core/function/alerterrorconnection.dart';
import 'package:smart_city/core/service/service.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController? email;
  TextEditingController? password;
  bool obscureText = true;
  StatusRequest? statusRequest;

  Map data = {};
  AppServeces serveces = Get.find<AppServeces>();
  back() {
    Get.back();
  }

  goToPageSingUp() {
    Get.toNamed(AppRoutes.signup);
  }

  goToPageForgetPassword() {
    Get.toNamed(AppRoutes.forgetpassword);
  }

  loadingPage(context) {
    var formdata = formState.currentState;
    if (formdata!.validate()) {

    }
  }

  login() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      Get.back();
      if (true) {
        // save the info for user
        serveces.sharedPreferences.setString("token", "data[access_token]");
        serveces.sharedPreferences
            .setString("id", "34".toString());
        serveces.sharedPreferences.setString("name", "Belaid oualid");
        serveces.sharedPreferences.setString("email", "walid04belaid@gmail.com");
        serveces.sharedPreferences.setInt("email", 1);
        Get.offNamed(AppRoutes.home)    ;
      } else {
        alertErrorConnection();
      }
    }
    update();
  }

  showpassword() {
    obscureText = !obscureText;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
