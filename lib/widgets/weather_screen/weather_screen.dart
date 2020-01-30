import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/states/app_state.dart';
import 'package:weather/widgets/weather_screen/weather_screen_content.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return FutureBuilder(
      future: appState.getWeather(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return WeatherScreenContent(snapshot.data);
        } else if (snapshot.hasError || (snapshot.connectionState == ConnectionState.done && snapshot.data == null)) {
          return AlertDialog(
            title: Text('Ooops'),
            content: Text(
                'Something went wrong. Make sure you enabled location services and have an active internet connection.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Try Again'),
                onPressed: () {
                  // TODO better way to trigger rebuild?
                  setState(() {});
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
