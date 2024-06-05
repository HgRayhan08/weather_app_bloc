import 'package:flutter/material.dart';
import 'package:weather_app_bloc/ui/opener_page.dart';
import 'package:weather_app_bloc/ui/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OpenerPage(),
      // home: WeatherPage(),
    );
  }
}
