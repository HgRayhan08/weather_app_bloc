part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {
  const WeatherEvent();

  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final double lat;
  final double lon;

  const FetchWeather(this.lat, this.lon);

  @override
  List<Object> get props => [lat, lon];
}
