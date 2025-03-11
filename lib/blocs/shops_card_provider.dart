import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zoodex/services/model.dart';

class ShopsCardProvider extends ChangeNotifier {
  List<ShopsModel> _items = [];
  bool _isLoading = true;

  List<ShopsModel> get items => _items;
  bool get isLoading => _isLoading;

  Future<void> fetchShopsCard() async {
    try {
      final response = await Dio().get('https://your-api.com/special-offers');
      List<dynamic> data = response.data;

      _items = data.map((json) => ShopsModel.fromJson(json)).toList();
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print("Error fetching data: $error");
      _isLoading = false;
      notifyListeners();
    }
  }
}
