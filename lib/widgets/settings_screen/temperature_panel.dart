import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/states/app_state.dart';
import 'package:weather/widgets/settings_screen/temperature_card.dart';

class TemperaturePanel extends StatelessWidget {
  TemperaturePanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            appState.isCelsius = true;
          },
          child: TemperatureCard(
            label: '°C',
            isSelected: appState.isCelsius == true,
          ),
        ),
        GestureDetector(
          onTap: () {
            appState.isCelsius = false;
          },
          child: TemperatureCard(
            label: '°F',
            isSelected: appState.isCelsius == false,
          ),
        ),
      ],
    );
  }
}
