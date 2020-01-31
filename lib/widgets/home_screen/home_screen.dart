import 'package:flutter/material.dart';
import 'package:weather/models/navigation_bar_item_model.dart';
import 'package:weather/widgets/home_screen/navigation_bar.dart';
import 'package:weather/widgets/settings_screen/settings_screen.dart';
import 'package:weather/widgets/weather_screen/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<NavigationBarItemModel> navigationItems = [
    NavigationBarItemModel(icon: Icon(Icons.calendar_today), title: 'Forecast'.toUpperCase()),
    NavigationBarItemModel(icon: Icon(Icons.settings), title: 'Settings'.toUpperCase()),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: selectedIndex == 0 ? WeatherScreen() : SettingsScreen(),
          bottomNavigationBar: NavigationBar(
            navigationItems: navigationItems,
            onIndexSelected: (index) => setState(() => selectedIndex = index),
          ),
        ),
      ),
    );
  }
}
