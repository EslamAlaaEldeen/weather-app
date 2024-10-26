import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/presentation/controller/weather_bloc.dart';

class WeatherScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Enter City Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<WeatherBloc>().add(FetchWeather(_controller.text));
                FocusScope.of(context).unfocus();
              },
              child: const Text("Get Weather"),
            ),
            const SizedBox(height: 80),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const CircularProgressIndicator();
                } else if (state is WeatherLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("City: ${state.weather.cityName}"),
                      Text("Weather: ${state.weather.main}"),
                      Text("Description: ${state.weather.description}"),
                      Text("Pressure: ${state.weather.pressure}"),
                    ],
                  );
                } else if (state is WeatherError) {
                  return Text(state.message,
                      style: const TextStyle(color: Colors.red));
                }
                return const Text("Enter a city name to see the weather.");
              },
            ),
          ],
        ),
      ),
    );
  }
}
