import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_bloc/bloc/weather_state.dart';
import 'package:weather_app_bloc/repository/weather_repository.dart';

part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weather =
            await weatherRepository.getWeather(event.lat, event.lon);
        emit(WeatherLoaded(weather));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
  }
}
