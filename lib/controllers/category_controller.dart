import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/category_model.dart';

class CategoryController extends ChangeNotifier {
  final APIService _apiService = APIService();
  List<CategoryModel> _categories = [];
  bool _isLoading = true;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    final response = await _apiService
        .getRequest('/vendors/city/kerman/vendor-types?'); // آدرس endpoint

    if (response != null) {
      _categories = (response as List)
          .map((json) => CategoryModel.fromJson(json))
          .toList();
    }

    _isLoading = false;
    notifyListeners();
  }
}
