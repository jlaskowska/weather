import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:weather/enums/weather_state.dart';

class WeatherForecast {
  final String weatherDescription;
  final WeatherState weatherState;
  final DateTime date;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;

  WeatherForecast({
    @required this.weatherDescription,
    @required this.weatherState,
    @required this.date,
    @required this.minTemp,
    @required this.maxTemp,
    @required this.currentTemp,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) => WeatherForecast(
        weatherDescription: json['weather_state_name'],
        weatherState: WeatherState.values.firstWhere((value) => describeEnum(value) == json['weather_state_abbr']),
        date: DateTime.parse(json['applicable_date']),
        minTemp: json['min_temp'].toDouble(),
        maxTemp: json['max_temp'].toDouble(),
        currentTemp: json['the_temp'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'weather_state_name': weatherDescription,
        'weather_state_abbr': weatherState,
        'applicable_date': date.toIso8601String(),
        'min_temp': minTemp,
        'max_temp': maxTemp,
        'the_temp': currentTemp,
      };

  @override
  String toString() => toJson().toString();
}
