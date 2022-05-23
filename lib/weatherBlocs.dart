import 'dart:async';
import 'package:weather/weatherServiceManager.dart';
import 'package:weather/weatherModel.dart';
abstract class Bloc {
  void dispose();
}

class WeatherBlocs implements Bloc {
  final _weatherController = StreamController<List<WeatherModel>>.broadcast();
  Stream<List<WeatherModel>> get weatherStream => _weatherController.stream;
  List<WeatherModel> weatherItemList = [];
  List<WeatherModel> weatherItemListDetails = [];


  Future fnGetWeather() async {
    weatherItemList.clear();
    weatherItemList = await WeatherServiceManager.getWeather();
    if (weatherItemList != null) {
      weatherItemListDetails.addAll(weatherItemList);
      _weatherController.sink.add(weatherItemListDetails);
    }
  }

  @override
  void dispose() {
    _weatherController.close();
  }
}
