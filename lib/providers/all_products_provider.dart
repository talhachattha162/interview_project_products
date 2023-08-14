import 'package:flutter/material.dart';

import '../models/product.dart';

class AllProductsProvider extends ChangeNotifier
{
 //variables
  List<Product> _allProducts = [];
int _currentPagePagination=1;

//getters
 List<Product> get allProducts => _allProducts;
 int get currentPagePagination => _currentPagePagination;

//setters
 set allProducts(List<Product> value) {
  _allProducts = value;
  notifyListeners();
 }

  set currentPagePagination(int value) {
    _currentPagePagination = value;
    notifyListeners();
  }
}