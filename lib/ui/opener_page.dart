import 'package:flutter/material.dart';
import 'package:weather_app_bloc/ui/weather_page.dart';

class OpenerPage extends StatelessWidget {
  const OpenerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuaca"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            Image(
              image: AssetImage(
                "assets/awan.png",
              ),
              width: 200,
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Text("Selamat Datanng Di Cuaca "),
            Text("Memberikan Informasi mengenai cuaca hari ini"),
            SizedBox(
              height: height * 0.05,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const WeatherPage()));
              },
              child: Text("Lanjutkan"),
            )
          ],
        ),
      ),
    );
  }
}
