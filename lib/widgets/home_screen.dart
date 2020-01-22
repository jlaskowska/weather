import 'package:flutter/material.dart';
import 'package:weather/services/weather_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text('Get Weather'),
          onPressed: () async {
            // final w = await WeatherService().getWeatherReportForCity('berlin');
            final w = await WeatherService().getWeatherReportForLocation('52.516071', '13.376980');
            print(w);
          },
        ),
      ),
    );
  }
}
