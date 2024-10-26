import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/domain/usecases/get_weather_by_counrty.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherByCountryName getWeather;

  WeatherBloc(this.getWeather) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weather = await getWeather.execute(event.cityName);
        emit(WeatherLoaded(weather));
      } catch (e) {
        emit(WeatherError("Couldn't fetch weather. Please try again."));
      }
    });
  }
}
