import 'package:weather/weather/data/datasource/remote_datasource.dart';
import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/domain/repository/Base_weather_Repository.dart';

class WeatherRepository implements BaseWeatherRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Weather> getWeatherByCityName(String countryName) async {
    return (await baseRemoteDataSource.getWeatherByCountryName(countryName))!;
  }
}
