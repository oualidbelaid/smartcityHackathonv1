import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransportController extends GetxController {
  final selectedTransportOption = 0.obs;

  // Sample transport options data (replace with actual data)
  final List<Map<String, dynamic>> transportOptions = [
    {
      'departureTime': '05 min', // Time to departure
      'travelTime': '20 min',   // Duration of travel
      'arrivalTime': '13:40',
      'departureLocation': 'Bab El Oued',
      'arrivalLocation': 'Casbah of Algiers',
      'price': '50 DZD',
      'transportTypes': ['Bus 12A', 'Tram'],
      'isFavorite': false,
    },
    {
      'departureTime': '10 min',
      'travelTime': '45 min',
      'arrivalTime': '14:00',
      'departureLocation': 'Didouche Mourad',
      'arrivalLocation': 'El Harrach',
      'price': '80 DZD',
      'transportTypes': ['Metro', 'Taxi'],
      'isFavorite': true,
    },
    {
      'departureTime': '08 min',
      'travelTime': '25 min',
      'arrivalTime': '13:50',
      'departureLocation': 'Boumerdes',
      'arrivalLocation': 'Reghaia',
      'price': '70 DZD',
      'transportTypes': ['Train', 'Bus 24C'],
      'isFavorite': false,
    },
    {
      'departureTime': '15 min',
      'travelTime': '60 min',
      'arrivalTime': '14:30',
      'departureLocation': 'Oran Gare',
      'arrivalLocation': 'Santa Cruz Fort',
      'price': '100 DZD',
      'transportTypes': ['Taxi'],
      'isFavorite': false,
    },
    {
      'departureTime': '03 min',
      'travelTime': '15 min',
      'arrivalTime': '13:35',
      'departureLocation': 'Cap Carbon',
      'arrivalLocation': 'Bejaia Center',
      'price': '40 DZD',
      'transportTypes': ['Bus 7A'],
      'isFavorite': true,
    },
  ].obs;


  void changeTransportOption(int index) {
    selectedTransportOption.value = index;
  }

  void toggleFavorite(int index) {
    transportOptions[index]['isFavorite'] = !transportOptions[index]['isFavorite'];
    //transportOptions.refresh();
  }
}
