import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:weather_app_asyc/jason_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  void getWeatherInfo() {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final Map<String, dynamic> current = jsonMap['current'];

    //update variables
    temperatureByFeeling =
        "Gefühlte Temperatur: ${current['apparent_temperature']}°";
    temperature = "Temperatur: ${current['temperature_2m']}°";
    rainfall = "Niederschlag: ${current['precipitation']}";
    dayTime = "Tageszeit: ${current['is_day'] == 1 ? 'Tag' : 'Nacht'}";
    location =
        "Standort: lat: ${jsonMap['latitude']}, long: ${jsonMap['longitude']}";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(66, 177, 155, 196),
              title: const Text(
                "Wetter-App",
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 68, 38, 95)),
              ),
            ),
            body: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Stadt: Stuttgart',
                    style: TextStyle(
                        fontSize: 25, color: Color.fromRGBO(79, 181, 240, 1)),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    (temperatureByFeeling),
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text((temperature), style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 5),
                  Text((rainfall), style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 5),
                  Text((dayTime), style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 5),
                  Text((location), style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),
                  OutlinedButton(
                      onPressed: () {
                        getWeatherInfo();
                        setState(() {});
                      },
                      child: const Text('Prophezeiung updaten')),
                ],
              ),
            )));
  }
}
