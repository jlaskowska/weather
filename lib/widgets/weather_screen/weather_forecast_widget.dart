import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/configs/app_colors.dart';
import 'package:weather/models/weather_forecast.dart';
import 'package:weather/states/app_state.dart';
import 'package:weather/utils/weather_utils.dart';

class WeatherForecastWidget extends StatelessWidget {
  final WeatherForecast weatherForecast;
  final double iconSize;
  final double sizedBoxHeight;
  final double temperatureFontSize;
  final double dateFontSize;

  WeatherForecastWidget(
    this.weatherForecast, {
    this.iconSize = 70.0,
    this.sizedBoxHeight = 30,
    this.temperatureFontSize = 20,
    this.dateFontSize = 12,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          WeatherUtils.iconForWeatherState(weatherForecast.weatherState),
          size: iconSize,
          color: AppColors.lightViolet,
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        Consumer<AppState>(builder: (_, appState, __) {
          return Text(
            appState.isCelsius
                ? weatherForecast.currentTemp.toStringAsFixed(0)
                : WeatherUtils.celsiusToFahrenheit(
                    weatherForecast.currentTemp.toInt(),
                  ).toStringAsFixed(0),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: temperatureFontSize,
              color: AppColors.lightRose,
            ),
          );
        }),
        Chip(
          backgroundColor: AppColors.lightViolet,
          label: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text(
              WeatherUtils.formatDate(weatherForecast.date),
              style: TextStyle(
                color: AppColors.darkViolet,
                fontWeight: FontWeight.bold,
                fontSize: dateFontSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
