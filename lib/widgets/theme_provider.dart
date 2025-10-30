import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool isLeftHanded = false;
  bool isDark = false;

  void toggleLeftHanded(bool value) {
    isLeftHanded = value;
    notifyListeners(); // avvisa i widget che devono aggiornarsi
  }

  void toggleDark(bool value) {
    isDark = value;
    notifyListeners();
  }
}
