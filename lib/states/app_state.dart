import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  bool _isCelsius = true;

  bool get isCelsius => _isCelsius;

  set isCelsius(bool value) {
    _isCelsius = value;
    notifyListeners();
  }
}
