import 'package:meta/meta.dart';
import 'package:weather/models/weather_forecast.dart';

class WeatherReport {
  final List<WeatherForecast> weatherForecast;
  final String title;
  final int woeid;
  final String lattLong;

  WeatherReport({
    @required this.weatherForecast,
    @required this.title,
    @required this.woeid,
    @required this.lattLong,
  });

  factory WeatherReport.fromJson(Map<String, dynamic> json) => WeatherReport(
        weatherForecast:
            List<WeatherForecast>.from(json['consolidated_weather'].map((x) => WeatherForecast.fromJson(x))),
        title: json['title'],
        woeid: json['woeid'],
        lattLong: json['latt_long'],
      );

  Map<String, dynamic> toJson() => {
        'consolidated_weather': List<dynamic>.from(weatherForecast.map((x) => x.toJson())),
        'title': title,
        'woeid': woeid,
        'latt_long': lattLong,
      };

  @override
  String toString() => toJson().toString();
}
