import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<Map<String, dynamic>> hotTrips = [
    {
      'imageUrl': 'assets/images/hotel1.jpg', // Replace with an actual image of Tassili n’Ajjer
      'title': 'Tassili n’Ajjer',
      'location': 'Djanet, Algeria',
    },
    {
      'imageUrl': 'assets/images/hotel2.jpg', // Replace with an image of Oran’s beach
      'title': 'Santa Cruz Fort',
      'location': 'Oran, Algeria',
    },
    {
      'imageUrl': 'assets/images/hotel3.jpg', // Replace with an image of Ghardaïa
      'title': 'M’zab Valley',
      'location': 'Ghardaïa, Algeria',
    },
    {
      'imageUrl': 'assets/images/hotel1.jpg', // Replace with an image of Tikjda
      'title': 'Tikjda Resort',
      'location': 'Kabylie, Algeria',
    },
    {
      'imageUrl': 'assets/images/hotel2.jpg', // Replace with an image of Timgad
      'title': 'Timgad Roman Ruins',
      'location': 'Batna, Algeria',
    },
    {
      'imageUrl': 'assets/images/hotel3.jpg', // Replace with an image of Bejaia
      'title': 'Cap Carbon',
      'location': 'Bejaia, Algeria',
    },
  ].obs;


  final List<Map<String, dynamic>> exploreMore = [
    {
      'imageUrl': 'https://via.placeholder.com/200x200/DC143C/FFFFFF?text=Miami',
      'title': 'Miami',
      'properties': '15,450 properties',
    },
    {
      'imageUrl': 'https://via.placeholder.com/200x200/6495ED/FFFFFF?text=City',
      'title': 'City',
      'properties': '20,000 properties',
    },
    // Add more destinations as needed...
  ].obs;
  // Data for Explore More section
  final List<Map<String, dynamic>> events = [
    {
      'imageUrl': 'assets/images/event1.jpg', // Replace with actual Algerian event images when available
      'title': 'Timgad Festival',
      'subtitle': 'Annual Music and Arts Festival in Timgad, Batna.',
    },
    {
      'imageUrl': 'assets/images/event2.jpg',
      'title': 'Ghardaïa Traditional Market',
      'subtitle': 'Discover the vibrant souks and unique architecture of M’zab Valley.',
    },
    {
      'imageUrl': 'assets/images/event3.jpg',
      'title': 'Constantine Bridge Tour',
      'subtitle': 'Explore the iconic bridges and breathtaking views of Constantine.',
    },
    {
      'imageUrl': 'assets/images/event1.jpg', // Reusing an image for demonstration
      'title': 'Hoggar Mountains Trek',
      'subtitle': 'Experience the Sahara Desert’s stunning Hoggar Mountains.',
    },
    {
      'imageUrl': 'assets/images/event2.jpg',
      'title': 'Bab El Oued Street Art',
      'subtitle': 'Discover Algiers’ vibrant street art and culture.',
    },
    {
      'imageUrl': 'assets/images/event3.jpg',
      'title': 'Setif Independence Day Parade',
      'subtitle': 'Celebrate Algeria’s rich history and independence.',
    },
  ].obs;


  final List<Map<String, dynamic>> activities = [
    {
      'imageUrl': 'assets/images/activ1.jpg', // Replace with actual Algerian activity images
      'title': 'Hiking in Djurdjura National Park',
      'subtitle': 'Explore the stunning landscapes and diverse wildlife of Kabylie.',
    },
    {
      'imageUrl': 'assets/images/activ2.jpg',
      'title': 'Algiers Casbah Tour',
      'subtitle': 'Discover the UNESCO World Heritage site and its rich history.',
    },
    {
      'imageUrl': 'assets/images/activ3.jpg',
      'title': 'Sandboarding in the Sahara',
      'subtitle': 'Enjoy an adrenaline-filled adventure on Sahara’s sand dunes.',
    },
    {
      'imageUrl': 'assets/images/activ1.jpg', // Reusing an image for demonstration
      'title': 'Visit to Timgad Roman Ruins',
      'subtitle': 'Explore the well-preserved Roman city of Timgad in Batna.',
    },
    {
      'imageUrl': 'assets/images/activ2.jpg',
      'title': 'Boat Ride in El Kala National Park',
      'subtitle': 'Relax and enjoy the serene waters and natural beauty.',
    },
    {
      'imageUrl': 'assets/images/activ3.jpg',
      'title': 'Cultural Evening in Ghardaïa',
      'subtitle': 'Experience traditional music, dance, and cuisine in M’zab Valley.',
    },
  ].obs;


  final List<Map<String, dynamic>> complexes = [
    {
      'imageUrl': 'assets/images/camp1.jpg', // Replace with actual Algerian complex images
      'title': 'Complexe Sportif de Chéraga',
      'subtitle': 'A modern sports club offering football, swimming, and tennis facilities.',
    },
    {
      'imageUrl': 'assets/images/camp2.jpg',
      'title': 'Resort Zeralda',
      'subtitle': 'A luxurious resort by the sea with family-friendly amenities.',
    },
    {
      'imageUrl': 'assets/images/camp3.jpg',
      'title': 'Complexe Touristique Tikjda',
      'subtitle': 'A mountain resort perfect for hiking and winter sports.',
    },
    {
      'imageUrl': 'assets/images/camp1.jpg', // Reused for demonstration
      'title': 'Complexe Olympique Mohamed Boudiaf',
      'subtitle': 'An iconic sports complex in Algiers with multiple facilities.',
    },
    {
      'imageUrl': 'assets/images/camp2.jpg',
      'title': 'Thermal Complex Hammam Righa',
      'subtitle': 'Relax in Algeria’s renowned hot springs and spa treatments.',
    },
    {
      'imageUrl': 'assets/images/camp3.jpg',
      'title': 'Complexe Les Andalouses',
      'subtitle': 'A coastal resort near Oran with stunning beaches and activities.',
    },
  ].obs;


  // Add methods for data fetching, search logic, etc. as needed.
  final isLoading = false.obs;

  Future<void> fetchData() async {
    isLoading.value = true;
    // Simulate fetching data
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
  }
}