import 'package:flutter/material.dart';
import 'package:weather/enums/weather_state.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/utils/weather_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                child: Text('Get Weather'),
                onPressed: () async {
                  // final w = await WeatherService().getWeatherReportForCity('berlin');
                  final w = await WeatherService().getWeatherReportForLocation('52.516071', '13.376980');
                  print(w);
                },
              ),
              for (WeatherState state in WeatherState.values) Icon(WeatherUtils.iconForWeatherState(state)),
            ],
          ),
        ),
      ),
    );
  }
}
