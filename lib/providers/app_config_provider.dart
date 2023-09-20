import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;
  String lan = "ar";
  static const String apptheme = 'appTheme';

  void changeAppTheme(ThemeMode newMode) async {
    if (appTheme == newMode) {
      return;
    }

    appTheme = newMode;

    notifyListeners();
  }

  void changeappLanuage(String l) {
    if (l == lan) {
      return;
    }

    lan = l;

    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }
}
