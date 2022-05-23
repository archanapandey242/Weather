import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/CommonWidget/SizeConfig.dart';
import 'package:weather/CommonWidget/calculation.dart';
import 'package:weather/CommonWidget/dateAndTime.dart';
import 'package:weather/CommonWidget/weatherIcon.dart';
import 'package:weather/WidgetOrientation/weatherDetailsLandscape.dart';
import 'package:weather/WidgetOrientation/weatherDetailsPortrait.dart';
import 'package:weather/weatherModel.dart';

class WeatherDetails extends StatefulWidget {
  List<WeatherList> weatherList;
  CityDetails cityDetails;
  WeatherDetails(this.weatherList, this.cityDetails);

  @override
  State<WeatherDetails> createState() => _WeatherDetailsPageState();
}

class _WeatherDetailsPageState extends State<WeatherDetails> {
  List<Map> weatherReport = [];
  bool showWeatherDetails = false;

  @override
  void initState() {
    weeklyWeather(this.widget.weatherList);
    // TODO: implement initState
    super.initState();
  }

  weeklyWeather(
      List<WeatherList> weatherList,
      ) {
    List<Map> weeklyListDay1 = [];
    List<Map> weeklyListDay2 = [];
    List<Map> weeklyListDay3 = [];
    List<Map> weeklyListDay4 = [];
    List<Map> weeklyListDay5 = [];
    for (int i = 0; i < weatherList.length; i++) {
      if (DateAndTime.returnWeeklyDays(weatherList[i].dateTime, 1)) {
        Map map = {
          "dateTime": weatherList[i].dateTime,
          "temp": weatherList[i].mainWeather.temp,
          "max_temp": weatherList[i].mainWeather.maxTemp,
          "precipitation": weatherList[i].cloudDetails.all,
          "humidity": weatherList[i].mainWeather.humidity,
          "pressure": weatherList[i].mainWeather.pressure,
          "wind": weatherList[i].windDetails.speed,
          "weather_status": weatherList[i].weatherStatus[0].main
        };
        weeklyListDay1.add(map);
      } else if (DateAndTime.returnWeeklyDays(weatherList[i].dateTime, 2)) {
        Map map = {
          "dateTime": weatherList[i].dateTime,
          "temp": weatherList[i].mainWeather.temp,
          "max_temp": weatherList[i].mainWeather.maxTemp,
          "precipitation": weatherList[i].cloudDetails.all,
          "humidity": weatherList[i].mainWeather.humidity,
          "pressure": weatherList[i].mainWeather.pressure,
          "wind": weatherList[i].windDetails.speed,
          "weather_status": weatherList[i].weatherStatus[0].main
        };
        weeklyListDay2.add(map);
      } else if (DateAndTime.returnWeeklyDays(weatherList[i].dateTime, 3)) {
        Map map = {
          "dateTime": weatherList[i].dateTime,
          "temp": weatherList[i].mainWeather.temp,
          "max_temp": weatherList[i].mainWeather.maxTemp,
          "precipitation": weatherList[i].cloudDetails.all,
          "humidity": weatherList[i].mainWeather.humidity,
          "pressure": weatherList[i].mainWeather.pressure,
          "wind": weatherList[i].windDetails.speed,
          "weather_status": weatherList[i].weatherStatus[0].main
        };
        weeklyListDay3.add(map);
      } else if (DateAndTime.returnWeeklyDays(weatherList[i].dateTime, 4)) {
        Map map = {
          "dateTime": weatherList[i].dateTime,
          "temp": weatherList[i].mainWeather.temp,
          "max_temp": weatherList[i].mainWeather.maxTemp,
          "precipitation": weatherList[i].cloudDetails.all,
          "humidity": weatherList[i].mainWeather.humidity,
          "pressure": weatherList[i].mainWeather.pressure,
          "wind": weatherList[i].windDetails.speed,
          "weather_status": weatherList[i].weatherStatus[0].main
        };
        weeklyListDay4.add(map);
      } else if (DateAndTime.returnWeeklyDays(weatherList[i].dateTime, 5)) {
        Map map = {
          "dateTime": weatherList[i].dateTime,
          "temp": weatherList[i].mainWeather.temp,
          "max_temp": weatherList[i].mainWeather.maxTemp,
          "precipitation": weatherList[i].cloudDetails.all,
          "humidity": weatherList[i].mainWeather.humidity,
          "pressure": weatherList[i].mainWeather.pressure,
          "wind": weatherList[i].windDetails.speed,
          "weather_status": weatherList[i].weatherStatus[0].main
        };
        weeklyListDay5.add(map);
      }
    }
    weatherReport.add(weeklyListDay1[0]);
    weatherReport.add(weeklyListDay2[0]);
    weatherReport.add(weeklyListDay3[0]);
    weatherReport.add(weeklyListDay4[0]);
    weatherReport.add(weeklyListDay5[0]);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        body: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) =>
            // checking orientation mode
            orientation == Orientation.portrait
                ? WeatherDetailsPortrait(
                this.widget.cityDetails, weatherReport)
                : WeatherDetailsLandscape(
                this.widget.cityDetails, weatherReport)));
  }
}
