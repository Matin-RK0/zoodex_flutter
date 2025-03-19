import 'package:flutter/material.dart';
import 'package:zoodex/models/banner_model.dart';
import 'package:zoodex/services/banner_service.dart';

class BannerProvider with ChangeNotifier {
  List<BannerModel> _banners = [];
  bool _isLoading = false;

  List<BannerModel> get banners => _banners;
  bool get isLoading => _isLoading;

  final BannerService _service = BannerService();

  Future<void> loadBanners() async {
    _isLoading = true;
    notifyListeners();
    try {
      _banners = await _service.fetchBanners();
    } catch (e) {
      print('Error loading banners: $e');
    }
    _isLoading = false;
    notifyListeners();
  }
}