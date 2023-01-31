import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDark = false;

  bool getDarkTheme() => _isDark;

  ThemeData getTheme() {
    return _isDark ? ThemeData.dark() : ThemeData.light();
  }

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}