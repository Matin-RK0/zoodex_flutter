import 'package:dio/dio.dart';

class APIService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl:
        'https://admin.zoodex.ir/api/v3',
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  ));

  Future<dynamic> getRequest(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('خطا: دریافت کد وضعیت ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('خطا در درخواست GET به $endpoint: $e');
      return null;
    }
  }
}
