import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:weather_app_bloc/bloc/weather_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_state.dart';
import 'package:weather_app_bloc/repository/weather_repository.dart';
import 'package:weather_app_bloc/services/api_service.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(
          weatherRepository: WeatherRepository(apiService: ApiService()))
        ..add(const FetchWeather(33.44, -94.04)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
          leading: Container(),
          // flexibleSpace:,
        ),
        body: const WeatherView(),
      ),
    );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoaded) {
          return Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 300),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 1000.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(state.weather.timezone,
                              style: const TextStyle(fontSize: 18)),
                          Text(state.weather.current.weather[0].main)
                        ],
                      ),
                      const Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://openweathermap.org/img/wn/10d@2x.png"),
                        width: 250,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is WeatherError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return Container();
      },
    );
  }
}
