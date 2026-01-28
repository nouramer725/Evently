import 'package:evently_app/provider/shared_preferences_theme.dart';
import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = SharedPreferencesTheme.getTheme();

  ThemeMode? theme;

  void changeTheme(ThemeMode newTheme) async {
    if (newTheme == appTheme) {
      return;
    }
    appTheme = newTheme;
    await SharedPreferencesTheme.setTheme(newTheme);
    theme = appTheme;
    notifyListeners();
  }

  bool isDarkTheme() {
    return appTheme == ThemeMode.dark;
  }
}
