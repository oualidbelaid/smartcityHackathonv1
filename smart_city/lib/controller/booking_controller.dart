import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_city/core/constant/approutes.dart';

class BookingPageController extends GetxController {
  final destination = ''.obs;
  final budget = 0.0.obs;
  final startDate = Rx<DateTime?>(null);
  final returnDate = Rx<DateTime?>(null);
  final activityTypes = <String>[].obs;

  final List<String> availableActivityTypes = [
    'Historical Tours',
    'Cultural Experiences',
    'Desert Adventures',
    'Mountain Hikes',
    'Beach Escapes',
    'City Sightseeing',
    'Food and Dining',
    'Shopping and Markets',
    'Religious Tourism',
    'Nature Walks',
    'Spa and Wellness',
    'Adventure Activities',
  ];

  void updateDestination(String value) {
    destination.value = value;
  }

  void updateBudget(double value) {
    budget.value = value;
  }

  void updateStartDate(DateTime? date) {
    startDate.value = date;
  }

  void updateReturnDate(DateTime? date) {
    returnDate.value = date;
  }

  void toggleActivityType(String type) {
    if (activityTypes.contains(type)) {
      activityTypes.remove(type);
    } else {
      activityTypes.add(type);
    }
  }

  void planVacation() {
    // Handle the planning logic here
    print('Destination: ${destination.value}');
    print('Budget: ${budget.value}');
    print('Start Date: ${startDate.value}');
    print('Return Date: ${returnDate.value}');
    print('Activity Types: ${activityTypes}');

    // You can add validation, API calls, and navigation logic here.
    // Example:
    if (destination.value.isEmpty) {
      Get.snackbar('Error', 'Please enter a destination.');
      return;
    }else{
      Get.toNamed(AppRoutes.plan);
    }

    // ... other validations

    // ... API call to a planning service

    // ... Navigate to a results page
    // Get.to(() => PlanningResultsPage(destination: destination.value, ...));
  }
}