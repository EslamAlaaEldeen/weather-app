import 'package:dio/dio.dart';
import 'package:weather/core/utils/constance.dart';
import 'package:weather/weather/data/models/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel?> getWeatherByCountryName(String countryName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel?> getWeatherByCountryName(String countryName) async {
    try {
      var response = await Dio().get(
          '${AppConstance.baseUrl}/weather?q=$countryName&appid=${AppConstance.appKey}');
      return WeatherModel.fromjson(response.data);
    } catch (e) {
      return null;
    }
  }
}
