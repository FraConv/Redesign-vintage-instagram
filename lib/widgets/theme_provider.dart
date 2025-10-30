import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool isLeftHanded = false;

  void toggleLeftHanded(bool value) {
    isLeftHanded = value;
    notifyListeners(); // avvisa i widget che devono aggiornarsi
  }
}
