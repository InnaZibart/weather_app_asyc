import 'package:http/http.dart';
import 'dart:convert';
import 'package:weather_app_asyc/http_class_definition.dart';

class WeatherDataRepository {
  final dataUri =
      'https://api.open-meteo.com/v1/forecast?latitude=48.783333&longitude=9.183333&current=temperature_2m,apparent_temperature,is_day,precipitation&timezone=Europe%2FBerlin&forecast_days=1';

  Future<String> getDataFromApi() async {
    final Response response = await get(Uri.parse(dataUri));

    final String jsonString = response.body;
    return jsonString;
  }

  Future<WeatherAllData> getData() async {
    final String jsonString = await getDataFromApi();
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    final WeatherAllData newWeatherData = WeatherAllData.fromJason(jsonMap);
    return newWeatherData;
  }
}
