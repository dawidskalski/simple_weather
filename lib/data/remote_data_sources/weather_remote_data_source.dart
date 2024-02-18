import 'package:dio/dio.dart';

class WeatherRemoteDataSource {
  Future<Map<String, dynamic>?> getWeatherDataSource({
    required String city,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'http://api.weatherapi.com/v1/current.json?key=d38f8e86968c4b779ee174902230604&q=$city&aqi=no');
      return response.data;
    } on DioException catch (error) {
      throw Exception(
          error.response?.data['error']['messge'] ?? 'Unknow error');
    }
  }
}
