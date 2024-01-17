import 'package:flutter/material.dart';
import 'package:weather_app_asyc/http_class_definition.dart';
import 'package:weather_app_asyc/http_weather_rep.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  WeatherDataRepository repository = WeatherDataRepository();
  WeatherAllData? weatherAllData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(66, 177, 155, 196),
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
                  OutlinedButton(
                      onPressed: () async {
                        weatherAllData = await repository.getData();
                        setState(() {});
                      },
                      child: const Text('Prophezeiung updaten')),
                ],
              ),
            )));
  }
}
