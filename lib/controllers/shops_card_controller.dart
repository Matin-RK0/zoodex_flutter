import 'package:flutter/material.dart';
import 'package:zoodex/models/shops_model.dart';
import 'package:zoodex/services/api_service.dart';

class ShopsCardController extends ChangeNotifier {
  final APIService _apiService = APIService();

  
  final Map<String, List<ShopsModel>> _shopsMap = {};
  final Map<String, bool> _loadingMap = {};

  List<ShopsModel> shops(String jsonKey) => _shopsMap[jsonKey] ?? [];
  bool isLoading(String jsonKey) => _loadingMap[jsonKey] ?? true;

  Future<void> fetchShops(String endpoint, String jsonKey ) async {
    _loadingMap[jsonKey] = true;
    notifyListeners();

    try {
      final data = await _apiService.getRequest(endpoint);
      if (data != null && data[jsonKey] != null) {
        List<dynamic> items = data[jsonKey];
        _shopsMap[jsonKey] = items.map((json) => ShopsModel.fromJson(json)).toList();
      }
    } catch (error) {
      print('خطا در دریافت فروشگاه‌ها برای $jsonKey: $error');
    } finally {
      _loadingMap[jsonKey] = false;
      notifyListeners();
    }
  }
}
