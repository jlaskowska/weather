import 'package:flutter/widgets.dart';
import 'package:weather/enums/weather_state.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherUtils {
  static const _mapWeatherStateIcon = const {
    WeatherState.sn: WeatherIcons.snow,
    WeatherState.sl: WeatherIcons.sleet,
    WeatherState.h: WeatherIcons.hail,
    WeatherState.t: WeatherIcons.thunderstorm,
    WeatherState.hr: WeatherIcons.rain,
    WeatherState.lr: WeatherIcons.showers,
    WeatherState.s: WeatherIcons.showers,
    WeatherState.hc: WeatherIcons.cloudy,
    WeatherState.lc: WeatherIcons.day_cloudy,
    WeatherState.c: WeatherIcons.day_sunny,
  };

  static IconData iconForWeatherState(WeatherState state) => _mapWeatherStateIcon[state];
}
