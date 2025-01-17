import 'package:weather/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(
      super.id, super.cityName, super.main, super.description, super.pressure);
  factory WeatherModel.fromjson(Map<String, dynamic> json) => WeatherModel(
      json['id'],
      json['name'],
      json['weather'][0]['main'],
      json['weather'][0]['description'],
      json['main']['pressure']);
}
