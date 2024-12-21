import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city/core/constant/appcolor.dart';

import '../../controller/search_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final SearchPageController controller = Get.put(SearchPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hi,Belaid!',
              style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5,),
            const Text(
              '• Alger, Alger center',
              style: TextStyle(
                color: AppColor.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildSearchBar(),
            const SizedBox(height: 10),
            _buildFilterTabs(),
            const SizedBox(height: 20),
            Expanded(
              child: _buildSearchResults(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      cursorColor: AppColor.primary,
      controller: controller.searchTextController, // Use the controller
      decoration: InputDecoration(
        hintText: 'Search ...',
        prefixIcon: const Icon(Icons.search),
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
      onChanged: (value) {
        // Call the search function when text changes
        controller.search(value);
      },
    );
  }

  // ... (rest of your SearchPage code: _buildFilterTabs, _buildFilterTab)

  Widget _buildSearchResults() {
    return Obx(() {
      // Use the filtered results
      final List<Map<String, dynamic>> results = controller.filteredResults;

      if (results.isEmpty) {
        return Center(
          child: Text("No results found."),
        );
      }

      return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final result = results[index];
          return _buildSearchResultCard(result, index);
        },
      );
    });
  }

  // ... (rest of your SearchPage code: _buildSearchResultCard)
  Widget _buildFilterTabs() {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildFilterTab('Hotel', 0),
        _buildFilterTab('Place', 1),
        _buildFilterTab('Event', 2),
        _buildFilterTab('Activity', 3),
      ],
    ));
  }

  Widget _buildFilterTab(String title, int index) {
    return InkWell(
      onTap: () {
        controller.changeTab(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: controller.selectedTab.value == index
              ? AppColor.primary
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: controller.selectedTab.value == index
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
  Widget _buildSearchResultCard(Map<String, dynamic> result, int index) {
    return Card(
      clipBehavior: Clip.antiAlias, // Added for image clipping
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: 150, // Adjust the height as needed
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                result['imageUrl'],
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Icon(Icons.star_half, color: Colors.amber, size: 18),
                        const SizedBox(width: 5),
                        Text(
                          '(${result["reviews"]} reviews)',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          controller.toggleFavorite(index);
                        },
                        child: Icon(
                          result['isFavorite']
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: result['isFavorite']
                              ? AppColor.primary
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}