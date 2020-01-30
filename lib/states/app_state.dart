import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/models/weather_report.dart';
import 'package:weather/services/location_service.dart';
import 'package:weather/services/weather_service.dart';

class AppState with ChangeNotifier {
  static SharedPreferences _sharedPreferences;
  final WeatherService _weatherService = WeatherService();

  AppState() {
    _init();
  }

  void _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // isCelsius

  static const _isCelsiusKey = 'isCelsius';

  bool _isCelsius = _sharedPreferences?.getBool(_isCelsiusKey) ?? true;

  bool get isCelsius => _isCelsius;

  set isCelsius(bool value) {
    _isCelsius = value;
    _sharedPreferences.setBool(_isCelsiusKey, value);
    notifyListeners();
  }

  // getWeather

  Future<WeatherReport> getWeather() async {
    List<String> position = await LocationService.getCurrentPosition();
    if (position != null && position.length == 2) {
      return _weatherService.getWeatherReportForLocation(position.first, position.last);
    }

    return null;
  }
}
