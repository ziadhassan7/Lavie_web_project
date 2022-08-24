import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier{

  static bool isRegistered = false;

  void registerUser() {
    isRegistered = true;
    notifyListeners();
  }
}