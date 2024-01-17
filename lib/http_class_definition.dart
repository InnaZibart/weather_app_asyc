class WeatherCurrent {
  double temperature;
  double apparentTemperature;
  bool isDay;
  double precipitation;

  WeatherCurrent(
      {required this.temperature,
      required this.apparentTemperature,
      required this.isDay,
      required this.precipitation});

  factory WeatherCurrent.fromJson(Map<String, dynamic> jsonMap) {
    return WeatherCurrent(
        temperature: jsonMap['temperature_2m'] ?? 0.0,
        apparentTemperature: jsonMap['apparent_temperature'] ?? 0.0,
        isDay: jsonMap['is_day'] ?? 0,
        precipitation: jsonMap['precipitation'] ?? 0.0);
  }
}

class WeatherAllData {
  double latitude;
  double longitude;
  Map<String, dynamic> current;

  WeatherAllData(
      {required this.latitude, required this.longitude, required this.current});

  factory WeatherAllData.fromJason(Map<String, dynamic> jsonMap) {
    return WeatherAllData(
      latitude: jsonMap['latitude'] ?? 0.0,
      longitude: jsonMap['longitude'] ?? 0.0,
      current: jsonMap['current'] ?? {},
    );
  }
}
