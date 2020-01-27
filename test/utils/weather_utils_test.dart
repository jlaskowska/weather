import 'package:flutter_test/flutter_test.dart';
import 'package:weather/enums/weather_state.dart';
import 'package:weather/utils/weather_utils.dart';

void main() {
  test('iconForWeatherState: IconData for each WeatherState', () {
    for (WeatherState state in WeatherState.values) {
      final iconData = WeatherUtils.iconForWeatherState(state);
      expect(iconData, isNotNull);
    }
  });

  test('celsiusToFahrenheit: nullC = nullF', () {
    final celsius = null;
    final fahrenheit = WeatherUtils.celsiusToFahrenheit(celsius);

    expect(fahrenheit, null);
  });

  test('celsiusToFahrenheit: 0C = 32F', () {
    final celsius = 0;
    final fahrenheit = WeatherUtils.celsiusToFahrenheit(celsius);

    expect(fahrenheit, 32);
  });

  test('celsiusToFahrenheit: 38C = 100F', () {
    final celsius = 38;
    final fahrenheit = WeatherUtils.celsiusToFahrenheit(celsius);

    expect(fahrenheit, 100);
  });
}
