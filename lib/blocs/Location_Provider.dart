import 'package:flutter/material.dart';

class LocationProvider extends ChangeNotifier {
  String _selectedLocation = 'کرمان';

  String get selectedLocation => _selectedLocation;

  void setLocation(String newLocation) {
    _selectedLocation = newLocation;
    notifyListeners();
  }
}
