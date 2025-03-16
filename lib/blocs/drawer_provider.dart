import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  String _selectedItem = '';
  bool _isDrawerOpen = false;

  String get selectedItem => _selectedItem;
  bool get isDrawerOpen => _isDrawerOpen;

  void selectItem(String item) {
    _selectedItem = item;
    notifyListeners();
  }

  void openDrawer() {
    _isDrawerOpen = true;
    notifyListeners();
  }

  void closeDrawer() {
    _isDrawerOpen = false;
    notifyListeners();
  }
}
