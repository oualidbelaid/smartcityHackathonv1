import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_city/core/constant/appcolor.dart';

class HotelDetails extends StatelessWidget {
  HotelDetails({Key? key}) : super(key: key);

  // Sample data (directly in the widget)
  final hotelDetails = {
    'imageUrl': 'assets/images/hotel1.jpg',
    'name': 'Hotel Royal Sea Crown',
    'location': 'Cox\'s Bazar , Bangladesh',
    'rating': 4.7,
    'price': 99.00,
    'amenities': ['Resto', 'Gym', 'Pool', 'More'],
    'description':
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut diam voluptua.',
    'reviews': [
      // Add your review data here
    ],
  };

  final selectedTab = 0.obs; // Using RxInt from GetX for tab state

  void changeTab(int index) {
    selectedTab.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: _buildCircleButton(Icons.arrow_back, () {
          // Handle bookmark action
          Get.back();
        }),
        actions: [
          _buildCircleButton(Icons.bookmark_border, () {
            // Handle bookmark action
          }),
        ],

      ),
      body: Center(
        child: ListView(
          children: [
            // Image with gradient overlay
            _buildImage(),

            // Content
            _buildContent(),





             _buildBookNowButton(),
SizedBox(height: 2.h,)
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(hotelDetails['imageUrl'].toString()),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Positioned(
      top: 300, // Adjust position based on image height
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hotelDetails['name'].toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on,
                      color: AppColor.primary, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    hotelDetails['location'].toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    '${hotelDetails['rating']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'DA${hotelDetails['price']}0/night',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Amenities',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _buildAmenitiesRow(),
              const SizedBox(height: 16),
              _buildDescriptionAndReviewsTabs(),
              const SizedBox(height: 16),
              Obx(() => _buildDescriptionOrReviewsContent()),
              const SizedBox(
                  height: 80), // Add space for the "Book Now" button
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),

        child: Icon(icon, color: Colors.black),
      ),
    );
  }

  Widget _buildAmenitiesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildAmenityItem('Resto', Icons.restaurant),
        _buildAmenityItem('Gym', Icons.fitness_center),
        _buildAmenityItem('Pool', Icons.pool),
        _buildAmenityItem('More', Icons.more_horiz),
      ],
    );
  }

  Widget _buildAmenityItem(String title, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.grey.shade700),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionAndReviewsTabs() {
    return Obx(() => Row(
      children: [
        _buildTab('Description', 0),
        _buildTab('Reviews', 1),
      ],
    ));
  }

  Widget _buildTab(String title, int index) {
    return InkWell(
      onTap: () {
        changeTab(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selectedTab.value == index
                  ? AppColor.primary
                  : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: selectedTab.value == index
                ? AppColor.primary
                : Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionOrReviewsContent() {
    if (selectedTab.value == 0) {
      return _buildDescriptionContent();
    } else {
      return _buildReviewsContent();
    }
  }

  Widget _buildDescriptionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotelDetails['description'].toString(),
          style: const TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {
            // Handle "Read More"
          },
          child: const Text(
            'Read More',
            style: TextStyle(
              color: AppColor.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsContent() {
    // Replace this with your actual reviews display
    return const Center(
      child: Text('Reviews will be displayed here.'),
    );
  }

  Widget _buildBookNowButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          // Handle "Book Now" action
        },
        child: const Text(
          'Book Now',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
    );
  }
}