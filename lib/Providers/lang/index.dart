import 'package:azmas/Utils/localStorage.dart';
import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  final storage = LocalStorage.instance;
  Locale _appLocale = Locale('am');

  Locale get appLocal => _appLocale;
  fetchLocale() async {
    String? lang = await storage.getLang();
    if (lang == null) {
      await storage.storeLang("em");
      _appLocale = Locale("em");
      notifyListeners();
    } else if (_appLocale != Locale(lang)) {
      _appLocale = Locale(lang);
      notifyListeners();
    }
  }

  void changeLanguage(Locale lang) async {
    if (_appLocale == lang) return;

    if (lang == Locale("am")) {
      _appLocale = Locale("am");
      await storage.storeLang("am");
    } else {
      _appLocale = Locale("en");
      await storage.storeLang("em");
    }
    notifyListeners();
  }
}
