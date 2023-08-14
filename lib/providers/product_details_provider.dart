import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier{
  double _containerHeight=0.37;

  double get containerHeight => _containerHeight;

  set containerHeight(double value) {
    _containerHeight = value;
    notifyListeners();
  }
}