import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(const MainApp());
}

const jsonString = """
 {
     "latitude": 48.78,
     "longitude": 9.18,
     "current": {
         "time": "2024-01-12T11:45",
         "temperature_2m": -3.6,
         "apparent_temperature": -7.0,
         "is_day": 1,
         "precipitation": 12.00
     }
 }
 """;

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String temperatureByFeeling = " Gefühlte Temperatur: -10°";
  String temperature = "Temperatur: -4°";
  String rainfall = "Niederschalg: 15.00 mm";
  String dayTime = "Tageszeit: Tag";
  String location = "Standort: lat: 48.783, long: 9.183";

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
