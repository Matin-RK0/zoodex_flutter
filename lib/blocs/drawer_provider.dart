import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  String _selectedItem = '';

  String get selectedItem => _selectedItem;

  void selectItem(String item) {
    _selectedItem = item;
    notifyListeners();
  }
}
