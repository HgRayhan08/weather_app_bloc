import 'package:weather_app_bloc/model/weather_model.dart';
import 'package:weather_app_bloc/services/api_service.dart';

class WeatherRepository {
  final ApiService apiService;

  WeatherRepository({required this.apiService});

  Future<WeatherModel> getWeather(double lat, double lon) async {
    final data = await apiService.feactWeather(lat, lon);
    return data;
  }
}
