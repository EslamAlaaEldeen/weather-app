import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/services/services.dart';
import 'package:weather/weather/presentation/controller/weather_bloc.dart';
import 'package:weather/weather/presentation/screens/weather_screen.dart';

void main() async {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WeatherBloc>(),
      child: MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        home: WeatherScreen(),
      ),
    );
  }
}
