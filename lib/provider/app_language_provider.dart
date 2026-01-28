import 'package:evently_app/provider/shared_preferences_language.dart';
import 'package:flutter/widgets.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLocal = SharedPreferencesLanguage.getLanguage() ?? "en";
  String? language;
  void changeLanguage(String newLang) async {
    if (newLang == appLocal) {
      return;
    }
    appLocal = newLang;
    await SharedPreferencesLanguage.setLanguage(newLang);
    language = appLocal;
    notifyListeners();
  }
}
