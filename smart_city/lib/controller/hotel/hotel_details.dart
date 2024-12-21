import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HotelDetailsController extends GetxController {
  // Sample data (replace with your actual data)
  final hotelDetails = {
    'imageUrl': 'https://via.placeholder.com/400x300/4682B4/FFFFFF?text=Hotel+Image',
    'name': 'Hotel Royal Sea Crown',
    'location': 'Dhaka, Bangladesh',
    'rating': 4.7,
    'price': 99.00,
    'amenities': ['Resto', 'Gym', 'Pool', 'More'],
    'description':
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut diam voluptua.',
    'reviews': [
      // Add your review data here
    ],
  }.obs;

  final selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
}
