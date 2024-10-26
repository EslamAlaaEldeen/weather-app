import 'package:get_it/get_it.dart';
import 'package:weather/weather/data/datasource/remote_datasource.dart';
import 'package:weather/weather/data/repository/Weather_repository.dart';
import 'package:weather/weather/domain/repository/Base_weather_Repository.dart';
import 'package:weather/weather/domain/usecases/get_weather_by_counrty.dart';
import 'package:weather/weather/presentation/controller/weather_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
    sl.registerLazySingleton<BaseWeatherRepository>(
        () => WeatherRepository(sl()));
    sl.registerLazySingleton(() => GetWeatherByCountryName(sl()));
    sl.registerFactory(() => WeatherBloc(sl()));
  }
}
