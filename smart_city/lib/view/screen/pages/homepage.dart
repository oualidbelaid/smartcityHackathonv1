import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city/controller/custom_drawer_controller.dart';
import 'package:smart_city/core/constant/appcolor.dart';
import 'package:smart_city/core/constant/approutes.dart';

import '../../../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              await controller.fetchData();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 20),
                    _buildPlanTripSection(),
                    const SizedBox(height: 20),
                    _buildSectionTitle('Hot trips', () {
                      // Handle "See all" for hot trips
                    }),
                    _buildHotTripsSection(),
                    const SizedBox(height: 20),
                    _buildSectionTitle('Explore more', () {
                      // Handle "See all" for explore more (all categories)
                    }),
                    _buildExploreMoreSection(),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hello, Belaid!',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        const SizedBox(height: 5),
        const Text(
          'Welcome back.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildPlanTripSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildPlanTripItem('Hotels', Icons.hotel),
        _buildPlanTripItem('Events', Icons.event),
        _buildPlanTripItem('camps', Icons.tour),
        GestureDetector(
            onTap: () {
              CustomDrawerController controllerd = Get.find();
              controllerd.selectedIndex(2);
            }, child: _buildPlanTripItem('Transport', Icons.directions_bus)),
      ],
    );
  }

  Widget _buildPlanTripItem(String title, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: title == 'Hotels'
                ? AppColor.primary
                : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: title == 'Hotels' ? Colors.white : Colors.grey.shade700,
            size: 30,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, VoidCallback onSeeAllTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

      ],
    );
  }

  Widget _buildHotTripsSection() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.hotTrips.length,
        itemBuilder: (context, index) {
          final trip = controller.hotTrips[index];
          return _buildHotTripCard(trip);
        },
      ),
    );
  }

  Widget _buildHotTripCard(Map<String, dynamic> trip) {
    return GestureDetector(
      onTap: () {
Get.toNamed(AppRoutes.hotelDetails);
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  trip['imageUrl'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              trip['title'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 2),
            Text(
              trip['location'],
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExploreMoreSection() {
    return Column(
      children: [
        _buildExploreMoreRow('Events', controller.events, () {
          // Handle "See all" for Events
          print('See all Events');
        }),
        _buildExploreMoreRow('Activities', controller.activities, () {
          // Handle "See all" for Activities
          print('See all Activities');
        }),
        _buildExploreMoreRow('Complexes', controller.complexes, () {
          // Handle "See all" for Complexes
          print('See all Complexes');
        }),
      ],
    );
  }

  Widget _buildExploreMoreRow(
      String title, List<Map<String, dynamic>> items, VoidCallback onSeeAllTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: onSeeAllTap,
                child: const Text('See all'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _buildExploreMoreCard(items[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildExploreMoreCard(Map<String, dynamic> item) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(

            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                item['imageUrl'],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 20,
            child: Text(
              overflow: TextOverflow.ellipsis,
              item['title'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const SizedBox(height: 2),
          Container(
            height: 20,
            child: Text(
              overflow: TextOverflow.ellipsis,
              item['subtitle'],

              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}