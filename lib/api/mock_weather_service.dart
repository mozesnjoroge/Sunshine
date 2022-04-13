import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sunshine/models/current_weather_model.dart';

class MockWeatherService {
  Future<CurrentWeatherModel> getCurrentWeatherData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    final weatherDataString = await _loadAssetSampleData(
        'assets/sample_data/current_weather_data.json');

    final Map<String, dynamic> json = jsonDecode(weatherDataString);

    if (json['location'] && json['current'] != null) {
      final currentWeatherData = CurrentWeatherModel.fromJson(json);
      print("from the mockweatherservice $currentWeatherData");
      return currentWeatherData;
    } else {
      return CurrentWeatherModel(
          locationName: 'unavailable',
          temperature: 0,
          windSpeed: 0,
          humidity: 0);
    }
  }

  Future<String> _loadAssetSampleData(String path) async {
    return rootBundle.loadString(path);
  }
}
