import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLanguage {
  static const String _languageKey = 'app_language';

  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static String? getLanguage() {
    return sharedPreferences.getString(_languageKey);
  }

  static Future<void> setLanguage(String lang) async {
    await sharedPreferences.setString(_languageKey, lang);
  }
}
