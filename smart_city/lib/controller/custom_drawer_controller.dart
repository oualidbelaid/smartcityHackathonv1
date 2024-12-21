import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city/core/service/service.dart';

class CustomDrawerController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  AppServeces services = Get.find();

  // Titles for each page (corresponding to bottom navigation items)
  final List<String> pageTitles = [
    'Home',
    'Search',
    'Transport',
    'Booking',
    'Profile',
  ];

  void selectPage(int index) {
    selectedIndex.value = index;
  }

  void logOut() {
    // Get.offAllNamed(AppRoutes.login); // Uncomment if you have a login route
  }
}