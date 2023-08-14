import 'package:flutter/material.dart';

class ObscureProvider extends ChangeNotifier{
 bool _obscurePassword=true;

 bool get obscurePassword => _obscurePassword;

  set obscurePassword(bool value) {
    _obscurePassword = value;
    notifyListeners();
  }
}