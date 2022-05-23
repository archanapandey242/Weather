import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/CommonWidget/SizeConfig.dart';
import 'package:weather/CommonWidget/calculation.dart';
import 'package:weather/CommonWidget/weatherIcon.dart';
import 'package:weather/weatherModel.dart';

import '../CommonWidget/dateAndTime.dart';

class WeatherDetailsLandscape extends StatefulWidget {
  CityDetails cityDetails;
  List<Map> weatherReport;
  WeatherDetailsLandscape(this.cityDetails, this.weatherReport);

  @override
  State<WeatherDetailsLandscape> createState() =>
      _WeatherDetailsLandscapePageState();
}

class _WeatherDetailsLandscapePageState extends State<WeatherDetailsLandscape> {
  int clickedIndex;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Container(
          height: 200,
          color: Colors.black12,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_outlined),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: SizeConfig.padding72),
                          child: Text(
                            this.widget.cityDetails.cityName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.font17),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            end: SizeConfig.padding16),
                        child: Icon(
                          Icons.segment,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: SizeConfig.padding16, start: SizeConfig.padding16),
                    child: Text(
                      "Next 7 days",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.font17,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsetsDirectional.zero,
// physics: NeverScrollableScrollPhysics(),
            itemCount: this.widget.weatherReport.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  setState(() {
                    clickedIndex = index;
                  });
                },
                title: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(WeatherIcon().weatherIcon(this
                                    .widget
                                    .weatherReport[index]["weather_status"])),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(DateAndTime.returnTodayDateAndDays(this
                                    .widget
                                    .weatherReport[index]["dateTime"])),
                              ],
                            ),
                            Row(
                              children: [
                                Text(TemperatureCalculation()
                                        .convertKelvinToCelsius(this
                                            .widget
                                            .weatherReport[index]["temp"]) +
                                    "\u00B0"),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  TemperatureCalculation()
                                          .convertKelvinToCelsius(
                                              this.widget.weatherReport[index]
                                                  ["max_temp"]) +
                                      "\u00B0",
                                  style: TextStyle(color: Color(0xFF9EAAAF)),
                                ),
                              ],
                            )
                          ],
                        ),
                        Visibility(
                          visible: clickedIndex == index,
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                              start: SizeConfig.padding16,
                              top: SizeConfig.padding10,
                              end: SizeConfig.padding45,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    weeklyWeatherDetails("Precipitation",
                                        "${this.widget.weatherReport[index]["precipitation"]} %"),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    weeklyWeatherDetails("Humidity",
                                        "${this.widget.weatherReport[index]["humidity"]} %"),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    weeklyWeatherDetails("Wind",
                                        "${this.widget.weatherReport[index]["wind"]} km/h"),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    weeklyWeatherDetails("Pressure",
                                        "${this.widget.weatherReport[index]["pressure"]} hPa"),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget weeklyWeatherDetails(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xFF000000))),
        const SizedBox(
          width: 8,
        ),
        Text(value,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xFF9EAAAF))),
      ],
    );
  }
}
