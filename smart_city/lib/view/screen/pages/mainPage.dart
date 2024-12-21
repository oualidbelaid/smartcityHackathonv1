import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city/core/constant/appcolor.dart';
import 'package:smart_city/view/screen/book_marks.dart';
import 'package:smart_city/view/screen/chat.dart';
import 'package:smart_city/view/screen/pages/planifie_page.dart';
import 'package:smart_city/view/screen/profile_page.dart';
import 'package:smart_city/view/screen/search_page.dart';

import '../../../controller/custom_drawer_controller.dart';
import 'homepage.dart';


class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final CustomDrawerController controller = Get.put(CustomDrawerController());

  // Define your pages here
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    TransportPage(),
    BookingPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        excludeHeaderSemantics: false,
        forceMaterialTransparency: false,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Obx(() => Text(controller.pageTitles[controller.selectedIndex.value])), // Dynamic title
        actions: [

          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.black,size: 28,),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: Obx(() => IndexedStack(
        index: controller.selectedIndex.value,
        children: _pages,
      )),
      bottomNavigationBar: Obx(() => _buildBottomNavigationBar()),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: controller.selectedIndex.value,
      onTap: (index) {
        controller.selectPage(index);
      },
      backgroundColor: Colors.white,
      selectedItemColor:  AppColor.primary,
      unselectedItemColor: Colors.grey.shade600,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined,), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.emoji_transportation_outlined), label: 'TransportPage'),
        BottomNavigationBarItem(icon: Icon(Icons.book_online_outlined), label: 'Booking'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}