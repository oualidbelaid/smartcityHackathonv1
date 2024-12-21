
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smart_city/core/constant/appcolor.dart';

import '../../controller/auth/transport_controller.dart';

class TransportPage extends StatelessWidget {
  TransportPage({Key? key}) : super(key: key);

  final TransportController controller = Get.put(TransportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Depart at: Now',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 16),
                _buildLocationCard(),
                const SizedBox(height: 16),
                _buildTransportOptionsTabs(),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Obx(() => _buildTransportOptionsList()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.radio_button_checked, color: AppColor.primary, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'From',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your location',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.radio_button_checked, color: Colors.orange, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'To',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Warsaw, Stare Miasto',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.swap_vert, color: AppColor.primary),
              onPressed: () {
                // Handle location swap
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransportOptionsTabs() {
    return Obx(() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTransportOptionTab('9 min', 0),
          _buildTransportOptionTab('15 min', 1),
          _buildTransportOptionTab('30 min', 2),
          _buildTransportOptionTab('12 min', 3),
        ],
      ),
    ));
  }

  Widget _buildTransportOptionTab(String title, int index) {
    return InkWell(
      onTap: () {
        controller.changeTransportOption(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: controller.selectedTransportOption.value == index
              ? Colors.white
              : Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            if (title == '9 min') Icon(Icons.directions_car, color: AppColor.primary),
            if (title == '15 min') Icon(Icons.directions_bus, color: AppColor.primary),
            if (title == '30 min') Icon(Icons.directions_transit, color: AppColor.primary),
            if (title == '12 min') Icon(Icons.directions_walk, color: AppColor.primary),
            SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                color: controller.selectedTransportOption.value == index
                    ? AppColor.primary
                    : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransportOptionsList() {
    return ListView.builder(
      itemCount: controller.transportOptions.length,
      itemBuilder: (context, index) {
        final option = controller.transportOptions[index];
        return _buildTransportOptionCard(option, index);
      },
    );
  }

  Widget _buildTransportOptionCard(Map<String, dynamic> option, int index) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Departure on: ${option['departureTime']}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  option['arrivalTime'],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Travel time: ${option['travelTime']}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                Row(
                  children: [
                    for (var transportType in option['transportTypes'])
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: _buildTransportTypeIcon(transportType),
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.radio_button_checked, color: AppColor.primary, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          option['departureLocation'],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.radio_button_checked, color: Colors.orange, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          option['arrivalLocation'],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle buy ticket action
                  },
                  icon: const Icon(Icons.local_atm,color: Colors.white,),
                  label: Text('Ticket: ${option['price']}',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransportTypeIcon(String type) {
    // Replace with appropriate icons for each transport type
    switch (type) {
      case '20':
        return Icon(Icons.directions_bus, color: Colors.blue);
      case 'N4':
        return Icon(Icons.directions_bus, color: Colors.blue);
      case '8':
        return Icon(Icons.directions_transit, color: Colors.orange);
      case '23':
        return Icon(Icons.directions_transit, color: Colors.orange);
      case 'N8':
        return Icon(Icons.directions_transit, color: Colors.orange);
      default:
        return Icon(Icons.directions, color: Colors.grey);
    }
  }
}