
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smart_city/core/constant/appcolor.dart';

import '../../../controller/trip_itinerary_controller.dart';

class TripItineraryPage extends StatelessWidget {
  TripItineraryPage({Key? key}) : super(key: key);

  final TripItineraryController controller = Get.put(TripItineraryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary,
      appBar: AppBar(
        backgroundColor: AppColor.secondary,
        elevation: 0,
        title: const Text('Trip Itinerary',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          PopupMenuButton<String>(
            color: Colors.white,
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              // Handle menu item selection
              print('Selected: $value');
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(

                  value: 'edit',
                  child: Text('Edit'),
                ),
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: Text('Delete'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDayTabs(),
          const SizedBox(height: 16),
          Expanded(
            child: Obx(() => _buildItineraryList(controller.days[controller.selectedDay.value])),
          ),
        ],
      ),
    );
  }

  Widget _buildDayTabs() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.days.length,
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = controller.selectedDay.value == index;
            return InkWell(
              onTap: () {
                controller.changeDay(index);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: isSelected ? AppColor.primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    controller.days[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildItineraryList(String day) {
    final itinerary = controller.itineraryData[day];

    if (itinerary == null) {
      return const Center(
        child: Text('No itinerary found for this day.'),
      );
    }

    return ListView.builder(
      itemCount: itinerary.length,
      itemBuilder: (context, index) {
        return _buildItineraryItem(itinerary[index], index, itinerary.length);
      },
    );
  }

  Widget _buildItineraryItem(Map<String, dynamic> item, int index, int totalItems) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                ),
              ),
              Expanded(
                child: Container(

                  width: 2,
                  color: index < totalItems - 1 ? AppColor.white : Colors.transparent, // Hide line for the last item
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['time'],
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 4),
                Icon(item['icon'], size: 25, color: AppColor.white),
              ],
            ),
          ),
          Expanded(
            child: Card(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['subtitle'],
                      style: const TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          // Handle "View Details"
                          print('View Details for ${item['title']}');
                        },
                        child: const Text(
                          'VIEW DETAILS',
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}