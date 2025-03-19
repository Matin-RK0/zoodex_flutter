import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  LatLng _selectedLocation = LatLng(35.6892, 51.3890);
  String _address = "کرمان";

  LatLng get selectedLocation => _selectedLocation;
  String get address => _address;

  Future<void> updateLocation(LatLng newLocation) async {
    _selectedLocation = newLocation;
    _address = await _convertLatLngToAddress(newLocation);
    notifyListeners();
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    await updateLocation(LatLng(position.latitude, position.longitude));
  }

  
  Future<String> _convertLatLngToAddress(LatLng location) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          location.latitude, location.longitude);
      return placemarks.isNotEmpty ? placemarks.first.street ?? "نامشخص" : "نامشخص";
    } catch (e) {
      return "خطا در دریافت آدرس";
    }
  }
}
