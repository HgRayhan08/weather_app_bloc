import 'package:dio/dio.dart';
import 'package:weather_app_bloc/model/weather_model.dart';

class ApiService {
  Future<WeatherModel> feactWeather(double lat, double long) async {
    final response = await Dio().get(
        "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$long&exclude=hourly,daily&appid=56709fad06fcd50734c856830771bfa3");
    // print(response.data);
    return WeatherModel.fromJson(response.data);
  }
}
