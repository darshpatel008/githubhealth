import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = Locale('en'); // Default language is English

  Locale get locale => _locale;

  void setLocale(String language) {
    switch (language) {
      case 'English':
        _locale = Locale('en');
        break;
      case 'Hindi':
        _locale = Locale('hi');
        break;
      case 'Gujarati':
        _locale = Locale('gu');
        break;
      default:
        _locale = Locale('en');
    }
    notifyListeners(); // Notify listeners to update the UI
  }
}
