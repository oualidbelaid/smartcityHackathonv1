import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripItineraryController extends GetxController {
  final selectedDay = 0.obs;
  final List<String> days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

  // Sample itinerary data (replace with your actual data)
  final RxMap<String, List<dynamic>> itineraryData = {
    'Sunday': [
      {
        'time': '07:00 am',
        'title': 'Sunrise View',
        'subtitle': 'Hilltop or Beachfront',
        'icon': Icons.wb_sunny,
        'details': 'Start your Sunday by watching a beautiful sunrise from a scenic spot.',
      },
      {
        'time': '08:30 am',
        'title': 'Breakfast',
        'subtitle': 'Local Cafe or Hotel Buffet',
        'icon': Icons.breakfast_dining,
        'details': 'Enjoy a hearty breakfast to kickstart your day.',
      },
      {
        'time': '10:00 am',
        'title': 'Nature Park Visit',
        'subtitle': 'Wildlife & Botanical Garden',
        'icon': Icons.park,
        'details': 'Explore the natural beauty and learn about local flora and fauna.',
      },
      {
        'time': '01:00 pm',
        'title': 'Lunch',
        'subtitle': 'Mountain View Restaurant',
        'icon': Icons.restaurant,
        'details': 'Relax and dine with a panoramic view of the surroundings.',
      },
      {
        'time': '03:00 pm',
        'title': 'Beach Relaxation',
        'subtitle': 'Leisure Time on the Beach',
        'icon': Icons.beach_access,
        'details': 'Spend the afternoon enjoying the sun, sand, and waves.',
      },
      {
        'time': '05:30 pm',
        'title': 'Evening Cruise',
        'subtitle': 'Sunset Boat Ride',
        'icon': Icons.directions_boat,
        'details': 'End the day with a scenic cruise during sunset.',
      },
      {
        'time': '07:30 pm',
        'title': 'Farewell Dinner',
        'subtitle': 'Fine Dining Experience',
        'icon': Icons.local_dining,
        'details': 'Enjoy a special farewell dinner at a top-rated restaurant.',
      },
      {
        'time': '09:00 pm',
        'title': 'Departure Preparation',
        'subtitle': 'Pack & Check-out',
        'icon': Icons.airplane_ticket,
        'details': 'Prepare for departure and check out of the accommodation.',
      },
    ],

    'Monday': [
      {
        'time': '06:30 am',
        'title': 'Morning Walk',
        'subtitle': 'Beachside Stroll',
        'icon': Icons.nordic_walking,
        'details': 'Start your day with a refreshing walk along the beach.',
      },
      {
        'time': '09:00 am',
        'title': 'Check In',
        'subtitle': 'Ocean View Resort',
        'icon': Icons.hotel,
        'details': 'Relax and enjoy the resort amenities.',
      },
      {
        'time': '11:00 am',
        'title': 'Historical Tour',
        'subtitle': 'Local Landmarks and Monuments',
        'icon': Icons.museum,
        'details': 'Explore the historical significance of the city.',
      },
      {
        'time': '01:00 pm',
        'title': 'Lunch',
        'subtitle': 'Seaside Grill',
        'icon': Icons.restaurant,
        'details': 'Enjoy fresh seafood at a local favorite.',
      },
      {
        'time': '03:00 pm',
        'title': 'Boat Cruise',
        'subtitle': 'Sunset Experience',
        'icon': Icons.directions_boat,
        'details': 'Sail along the coast and enjoy a serene sunset.',
      },
      {
        'time': '06:30 pm',
        'title': 'Dinner',
        'subtitle': 'Skyline Rooftop Cafe',
        'icon': Icons.restaurant_menu,
        'details': 'Dine with a breathtaking city view.',
      },
    ],
    'Tuesday': [
      {
        'time': '07:00 am',
        'title': 'Yoga Session',
        'subtitle': 'Beachfront Yoga',
        'icon': Icons.self_improvement,
        'details': 'Start your day with a relaxing yoga session.',
      },
      {
        'time': '09:30 am',
        'title': 'Breakfast',
        'subtitle': 'Local Cafe',
        'icon': Icons.breakfast_dining,
        'details': 'Taste local breakfast delicacies.',
      },
      {
        'time': '10:30 am',
        'title': 'Mountain Hike',
        'subtitle': 'Nature Trails',
        'icon': Icons.terrain,
        'details': 'Explore scenic mountain trails.',
      },
      {
        'time': '01:00 pm',
        'title': 'Lunch',
        'subtitle': 'Forest Bistro',
        'icon': Icons.restaurant,
        'details': 'Relax and enjoy a forest-themed meal.',
      },
      {
        'time': '03:00 pm',
        'title': 'Cultural Village Tour',
        'subtitle': 'Experience Local Traditions',
        'icon': Icons.villa,
        'details': 'Learn about the traditions and culture of the area.',
      },
      {
        'time': '07:00 pm',
        'title': 'Night Market Visit',
        'subtitle': 'Shopping and Food Stalls',
        'icon': Icons.shopping_cart,
        'details': 'Shop for souvenirs and enjoy street food.',
      },
    ],
    'Wednesday': [
      {
        'time': '08:00 am',
        'title': 'Breakfast Buffet',
        'subtitle': 'Resort Dining Hall',
        'icon': Icons.local_dining,
        'details': 'Fuel up with a variety of breakfast options.',
      },
      {
        'time': '10:00 am',
        'title': 'City Sightseeing',
        'subtitle': 'Guided Bus Tour',
        'icon': Icons.bus_alert,
        'details': 'See the main attractions of the city.',
      },
      {
        'time': '01:00 pm',
        'title': 'Lunch',
        'subtitle': 'Historic Inn',
        'icon': Icons.restaurant,
        'details': 'Enjoy traditional cuisine in a historic setting.',
      },
      {
        'time': '03:00 pm',
        'title': 'Museum Visit',
        'subtitle': 'Art and History Exhibits',
        'icon': Icons.art_track,
        'details': 'Discover art and history at the local museum.',
      },
      {
        'time': '05:00 pm',
        'title': 'Rest',
        'subtitle': 'Resort Spa',
        'icon': Icons.spa,
        'details': 'Relax and unwind with a spa session.',
      },
      {
        'time': '07:30 pm',
        'title': 'Dinner Show',
        'subtitle': 'Cultural Performance',
        'icon': Icons.theater_comedy,
        'details': 'Enjoy dinner with live cultural entertainment.',
      },
    ],
    // Add similar activities for the rest of the week
    'Thursday': [/* Activities */],
    'Friday': [/* Activities */],
    'Saturday': [/* Activities */],
  }.obs;


  void changeDay(int index) {
    selectedDay.value = index;
  }
}
