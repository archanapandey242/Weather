import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:weather/CommonWidget/SizeConfig.dart';
import 'package:weather/CommonWidget/calculation.dart';
import 'package:weather/CommonWidget/dateAndTime.dart';
import 'package:weather/CommonWidget/hourlyWeatherWidget.dart';
import 'package:weather/CommonWidget/weatherIcon.dart';
import 'package:weather/WidgetOrientation/weatherLandscapeOrientation.dart';
import 'package:weather/weatherBlocs.dart';
import 'package:weather/weatherDetails.dart';
import 'package:weather/weatherModel.dart';
import 'package:weather/WidgetOrientation/weatherPortraitOrientation.dart';

class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<Weather> {
  WeatherBlocs weatherBlocs;

  @override
  void initState() {
    weatherBlocs = WeatherBlocs(); // initialize bloc
    weatherBlocs.fnGetWeather(); // call weather API
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/png/weather_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) =>
                  orientation == Orientation.portrait
                      ? WeatherPortraitOrientation()
                          .portraitMode(weatherBlocs, context)
                      : WeatherLandscapeOrientation()
                          .landscapeMode(weatherBlocs, context))),
    );
  }
}
