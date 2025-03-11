import 'package:flutter/material.dart';

class LocalProvider extends ChangeNotifier {
  String _locale = "ar"; // اللغة الافتراضية

  String get locale => _locale;

  void changeLanguage(String languageCode) {
    _locale = languageCode;
    notifyListeners(); // تحديث الواجهة عند تغيير اللغة
  }
}
