import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city/core/constant/approutes.dart';
class ProfilePageController extends GetxController {
  // Sample user data (replace with actual data fetching)
  final userProfile = {
    'name': 'Belaid Oualid',
    'email': 'walid04belaid@gmail.com',
    'imageUrl': 'assets/images/profile1.jpg', // Replace with actual image URL
  }.obs;

  void editProfile() {
    // Handle edit profile action
    print('Edit Profile');
    // Example: Navigate to Edit Profile page
    // Get.to(() => EditProfilePage());
  }

  void viewCollections() {
    // Handle view collections action
    print('View Collections');
  }

  void viewBlockedUsers() {
    // Handle view blocked users action
    print('View Blocked Users');
  }

  void goToSettings() {
    // Handle settings action
    print('Go to Settings');
  }

  void logout() {
    Get.offAllNamed(AppRoutes.login);
    // Handle logout action
    print('Logout');
  }
}