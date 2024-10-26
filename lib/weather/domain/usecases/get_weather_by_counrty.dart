import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/domain/repository/Base_weather_Repository.dart';

class GetWeatherByCountryName {
  final BaseWeatherRepository repository;

  GetWeatherByCountryName(this.repository);

  Future<Weather> execute(String cityName) async {
    return await repository.getWeatherByCityName(cityName);
  }
}
