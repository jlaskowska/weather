import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState with ChangeNotifier {
  static SharedPreferences _sharedPreferences;

  AppState() {
    _init();
  }

  void _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // isCelsius

  static const _isCelsiusKey = 'isCelsius';

  bool _isCelsius = _sharedPreferences?.getBool(_isCelsiusKey) ?? true;

  bool get isCelsius => _isCelsius;

  set isCelsius(bool value) {
    _isCelsius = value;
    _sharedPreferences.setBool(_isCelsiusKey, value);
    notifyListeners();
  }
}
