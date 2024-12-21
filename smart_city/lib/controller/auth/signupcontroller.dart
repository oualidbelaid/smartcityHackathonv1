import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city/core/class/statusrequest.dart';
import 'package:smart_city/core/constant/approutes.dart';
import 'package:smart_city/core/function/alerterrorconnection.dart';

import '../../core/service/service.dart';

class SignUpController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController? username;
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? passwordConfirm;
  bool obscureText = true;

  StatusRequest? statusRequest;

  Map data = {};
  AppServeces serveces = Get.find<AppServeces>();

  back() {
    Get.back();
  }

  next() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      // Simulate a successful signup and get data (replace with actual API call)
      await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
      bool signupSuccess = true; // Replace with actual API response

      if (signupSuccess) {
        // Save the info for user (replace with actual data from API)
        serveces.sharedPreferences.setString("token", "your_generated_token");
        serveces.sharedPreferences.setString("id", "123"); // Replace with user ID
        serveces.sharedPreferences.setString("name", username!.text);
        serveces.sharedPreferences.setString("email", email!.text);
        serveces.sharedPreferences.setBool("isLoggedIn", true); // Indicate logged in status

        statusRequest = StatusRequest.success;
        update();

        Get.offAllNamed(AppRoutes.home); // Go to home and clear the navigation stack
      } else {
        statusRequest = StatusRequest.failure;
        update();
        alertErrorConnection(); // Show an error message
      }
    }
  }

  showpassword() {
    obscureText = !obscureText;
    update();
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    passwordConfirm = TextEditingController();
    super.onInit();
  }
}