import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_report.dart';

class WeatherService {
  static const _baseEndpoint = 'https://www.metaweather.com/api/location';
  static const _searchEndpoint = '$_baseEndpoint/search';

  Future<WeatherReport> getWeatherReportForCity(String cityName) async {
    if (cityName != null || cityName.isNotEmpty) {
      cityName.toLowerCase();

      try {
        String url = '$_searchEndpoint/?query=$cityName';
        http.Response response = await http.get(url);
        List<dynamic> jsonDecodedData = jsonDecode(response.body);
        if (jsonDecodedData != null && jsonDecodedData.length > 0 && jsonDecodedData[0].containsKey('woeid')) {
          int woeid = jsonDecodedData[0]['woeid'];
          if (woeid != null) {
            return await _getWeatherReportForWoeid(woeid);
          }
        }
      } catch (e) {
        print(e);
      }
    }

    return null;
  }

  Future<WeatherReport> getWeatherReportForLocation(String latitude, String longitude) async {
    if (latitude != null && longitude != null && latitude.isNotEmpty && longitude.isNotEmpty) {
      try {
        String url = '$_searchEndpoint/?lattlong=$latitude,$longitude';
        http.Response response = await http.get(url);
        List<dynamic> jsonDecodedData = jsonDecode(response.body);
        if (jsonDecodedData != null && jsonDecodedData.length > 0 && jsonDecodedData[0].containsKey('woeid')) {
          int woeid = jsonDecodedData[0]['woeid'];
          if (woeid != null) {
            return await _getWeatherReportForWoeid(woeid);
          }
        }
      } catch (e) {
        print(e);
      }
    }
    return null;
  }

  Future<WeatherReport> _getWeatherReportForWoeid(int woeid) async {
    try {
      String url = '$_baseEndpoint/$woeid/';
      http.Response response = await http.get(url);
      dynamic jsonDecodedData = jsonDecode(response.body);
      if (jsonDecodedData != null) {
        return WeatherReport.fromJson(jsonDecodedData);
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
