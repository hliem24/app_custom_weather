import 'dart:convert';

import 'package:alarm/Model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  fetchWeather() async {
    final response = await http.get(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=39f3c6bedb4dc7f551eac49ce3badd21",
      ),
    );
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        throw Exception('tthất bại chạy weather data');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
