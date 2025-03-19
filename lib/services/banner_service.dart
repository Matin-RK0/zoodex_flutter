import 'package:zoodex/models/banner_model.dart';
import 'api_service.dart';

class BannerService {
  final APIService _apiService = APIService();

  Future<List<BannerModel>> fetchBanners() async {
    final response = await _apiService
        .getRequest('/banners/mobile_main_first_slider/city/kerman?');
    if (response != null) {
      return (response as List)
          .map((json) => BannerModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load banners');
    }
  }
}
