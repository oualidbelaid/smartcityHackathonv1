import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_city/core/constant/approutes.dart';
import 'package:smart_city/core/service/service.dart';

import '../data/source/static/onbairdinglist.dart';

class OnbaordingController extends GetxController {
  int incrm = 0;
  AppServeces? serveces = Get.find<AppServeces>();

  PageController? pageController;
  double percent = 0.0;
  onchange(index) {
    incrm = index;
    percent = ((incrm * 100) / onbaordingList.length) / 100;

    update();
  }

  next() {
    if (incrm >= onbaordingList.length - 1) {
      percent = 1;
      Future.delayed(const Duration(milliseconds: 510), () {
        serveces!.sharedPreferences.setBool("onboarding", true);
        Get.offAllNamed(AppRoutes.login);
      });
    } else {
      pageController?.nextPage(
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
      incrm++;
      percent = ((incrm * 100) / (onbaordingList.length)) / 100;
    }
    update();
  }

  back() {
    if (incrm != 0) {
      pageController?.previousPage(
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
      percent = ((incrm * 100) / (onbaordingList.length)) / 100;
    }
    update();
  }

  skip() {
    serveces!.sharedPreferences.setBool("onboarding", true);
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    // incrm = 0;
    pageController = PageController();
    super.onInit();
  }
}
