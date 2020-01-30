import 'package:flutter/material.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/widgets/weather_screen/weather_screen_content.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future weatherFuture = WeatherService().getWeatherReportForCity('Berlin');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: weatherFuture,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return WeatherScreenContent(snapshot.data);
        } else if (snapshot.hasError || (snapshot.connectionState == ConnectionState.done && snapshot.data == null)) {
          return AlertDialog(
            title: Text('Ooops'),
            content: Text('Something went wrong. Make sure you have an internet connection.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Try Again'),
                onPressed: () {
                  setState(() {
                    weatherFuture = WeatherService().getWeatherReportForCity('Berlin');
                  });
                },
              )
            ],
          );
        }

        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
