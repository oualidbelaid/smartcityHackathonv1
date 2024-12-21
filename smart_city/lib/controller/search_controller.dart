import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  final selectedTab = 0.obs;
  final searchTextController = TextEditingController(); // Controller for search text
  final List<Map<String, dynamic>> allSearchResults = [
    {
      'imageUrl': 'assets/images/place1.jpg', // Replace with an actual image of Tipasa
      'title': 'Tipasa Archaeological Park',
      'rating': 4.7,
      'reviews': 3200,
      'isFavorite': false,
    },
    {
      'imageUrl': 'assets/images/place2.jpg', // Replace with an image of Oran
      'title': 'Oran City Center',
      'rating': 4.5,
      'reviews': 2500,
      'isFavorite': true,
    },
    {
      'imageUrl': 'assets/images/place3.jpg', // Replace with an image of Algiers
      'title': 'Casbah of Algiers',
      'rating': 4.8,
      'reviews': 4500,
      'isFavorite': false,
    },
    {
      'imageUrl': 'assets/images/place1.jpg', // Reused for demonstration
      'title': 'Ghardaïa City Center',
      'rating': 4.6,
      'reviews': 1900,
      'isFavorite': true,
    },
    {
      'imageUrl': 'assets/images/place2.jpg', // Replace with an image of Bejaia
      'title': 'Cap Carbon',
      'rating': 4.4,
      'reviews': 1700,
      'isFavorite': false,
    },
    {
      'imageUrl': 'assets/images/place3.jpg', // Replace with an image of Timgad
      'title': 'Timgad Roman Ruins',
      'rating': 4.9,
      'reviews': 3000,
      'isFavorite': true,
    },
  ].obs;


  // Filtered results (initially the same as allSearchResults)
  final filteredResults = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredResults.assignAll(allSearchResults); // Initialize filteredResults
  }

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void search(String query) {
    if (query.isEmpty) {
      filteredResults.assignAll(allSearchResults);
    } else {
      filteredResults.assignAll(allSearchResults.where((result) {
        return result['title'].toLowerCase().contains(query.toLowerCase());
      }));
    }
  }

  void toggleFavorite(int index) {
    // Find the item in allSearchResults based on the title
    final itemIndex = allSearchResults.indexWhere((item) => item['title'] == filteredResults[index]['title']);

    if (itemIndex != -1) {
      allSearchResults[itemIndex]['isFavorite'] = !allSearchResults[itemIndex]['isFavorite'];

      // Update isFavorite in filteredResults as well
      filteredResults[index]['isFavorite'] = allSearchResults[itemIndex]['isFavorite'];

      filteredResults.refresh(); // Refresh the UI
    }
  }
}