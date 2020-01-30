import 'package:flutter/material.dart';
import 'package:weather/configs/app_colors.dart';
import 'package:weather/models/weather_forecast.dart';
import 'package:weather/models/weather_report.dart';
import 'package:weather/widgets/weather_screen/weather_forecast_widget.dart';

class WeatherScreenContent extends StatelessWidget {
  final WeatherReport weatherReport;

  const WeatherScreenContent(this.weatherReport, {Key key}) : super(key: key);

  WeatherForecast get forecastToday => weatherReport.weatherForecast.first;
  List<WeatherForecast> get forecastOtherDays => weatherReport.weatherForecast.sublist(1);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            weatherReport.title.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 50,
              color: AppColors.lightRose,
            ),
          ),
          Text(
            forecastToday.weatherDescription,
            style: TextStyle(color: AppColors.lightViolet, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          WeatherForecastWidget(
            forecastToday,
            iconSize: 120.0,
            sizedBoxHeight: 50.0,
            temperatureFontSize: 60.0,
            dateFontSize: 20,
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (WeatherForecast forecast in forecastOtherDays)
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: WeatherForecastWidget(forecast),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
