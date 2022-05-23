import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:weather/weatherModel.dart';

class WeatherServiceManager {
  static Future<dynamic> getWeather() async {
    String url;
      url = 'https://api.openweathermap.org/data/2.5/forecast?q=bengaluru&appid=127bb922201c26968d7a06b8bebb15a3';
      final response = await http
          .get(Uri.parse(url), headers: {"Accept": "application/json"});
      List<WeatherModel> list = [];
      list.add(
          WeatherModel.fromJson(json.decode(response.body.toString())));
      return list;
  }

}
