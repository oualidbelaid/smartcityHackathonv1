import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/approutes.dart';
import '../service/service.dart';

class AppMiddleware extends GetMiddleware {
  AppServeces serveces = Get.find();
  int? get priority => 0;
  @override
  RouteSettings? redirect(String? route) {
    if (serveces.sharedPreferences.getBool("onboarding") == true) {
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}
