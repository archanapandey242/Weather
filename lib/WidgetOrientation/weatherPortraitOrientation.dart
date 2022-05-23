import 'package:flutter/material.dart';
import 'package:weather/CommonWidget/SizeConfig.dart';
import 'package:weather/CommonWidget/calculation.dart';
import 'package:weather/CommonWidget/dateAndTime.dart';
import 'package:weather/CommonWidget/hourlyWeatherWidget.dart';
import 'package:weather/CommonWidget/weatherIcon.dart';
import 'package:weather/weatherBlocs.dart';
import 'package:weather/weatherDetails.dart';
import 'package:weather/weatherModel.dart';

class WeatherPortraitOrientation {
  Widget portraitMode(WeatherBlocs weatherBlocs, BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: StreamBuilder<List<WeatherModel>>(
          stream: weatherBlocs.weatherStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: SizeConfig.padding170,
                              top: SizeConfig.padding16),
                          child: Text(
                            snapshot.data[0].cityDetails.cityName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.font17),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            end: SizeConfig.padding16),
                        child: Icon(Icons.segment, color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(top: SizeConfig.padding45),
                    child: Text(
                      DateAndTime.returnTodayDate(
                              snapshot.data[0].weatherList[0].dateTime)
                          ? "Today"
                          : "",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.font24,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(top: SizeConfig.padding6),
                    child: Text(
                      DateAndTime.returnTodayDateAndDays(
                          snapshot.data[0].weatherList[0].dateTime),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.font11,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(top: SizeConfig.padding45),
                    child: Text(
                      TemperatureCalculation().convertKelvinToCelsius(snapshot
                              .data[0].weatherList[0].mainWeather.temp) +
                          "\u2103",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(top: SizeConfig.padding6),
                    child: Text(
                      "Feels like ${TemperatureCalculation().convertKelvinToCelsius(snapshot.data[0].weatherList[0].mainWeather.temp) + "\u00B0"}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.font11,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: SizeConfig.padding16, start: SizeConfig.padding16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                DateAndTime.returnTodayDate(snapshot
                                        .data[0].weatherList[0].dateTime)
                                    ? "Today"
                                    : "",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.font15),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text(
                                "Tomorrow",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.font15),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              end: SizeConfig.padding16),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WeatherDetails(
                                        snapshot.data[0].weatherList,
                                        snapshot.data[0].cityDetails)),
                              );
                            },
                            child: Text(
                              "Next 5 days >",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: SizeConfig.font15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.white12,
                    thickness: 1,
                  ),
                  Container(
                      height: 110,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data[0].weatherList.length,
                          shrinkWrap: true,
                          padding: EdgeInsetsDirectional.zero,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            return HourlyWeatherWidget().hourlyWeather(
                                context,
                                snapshot.data[0].weatherList[index].dateTime,
                                TemperatureCalculation().convertKelvinToCelsius(
                                    snapshot.data[0].weatherList[index]
                                        .mainWeather.temp),
                                WeatherIcon().weatherIcon(snapshot.data[0]
                                    .weatherList[index].weatherStatus[0].main));
                          })),
                  const SizedBox(
                    height: 70,
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height - 699,
                      color: Colors.transparent,
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0))),
                          child: Column(
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      top: SizeConfig.padding10),
                                  child: Container(
                                    width: 50,
                                    height: 5,
                                    decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(40.0),
                                            topRight: Radius.circular(40.0),
                                            bottomLeft: Radius.circular(40.0),
                                            bottomRight:
                                                Radius.circular(40.0))),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: SizeConfig.padding32,
                                    end: SizeConfig.padding50),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              top: SizeConfig.padding45),
                                          child: Text(
                                            "SUNRISE",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: SizeConfig.font11,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              top: SizeConfig.padding6),
                                          child: Text(
                                            DateAndTime.returnTime(snapshot
                                                .data[0].cityDetails.sunrise),
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: SizeConfig.font17,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              top: SizeConfig.padding16),
                                          child: Text(
                                            "PRECIPITATION",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: SizeConfig.font11,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              top: SizeConfig.padding6),
                                          child: Text(
                                            snapshot.data[0].weatherList[0]
                                                .cloudDetails.all
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: SizeConfig.font17,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              top: SizeConfig.padding16),
                                          child: Text(
                                            "WIND",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: SizeConfig.font11,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              top: SizeConfig.padding6),
                                          child: Text(
                                            "${snapshot.data[0].weatherList[0].windDetails.speed.toString()} km/h",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: SizeConfig.font17,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              top: SizeConfig.padding45),
                                          child: Text(
                                            "SUNSET",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: SizeConfig.font11,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              top: SizeConfig.padding6),
                                          child: Text(
                                            DateAndTime.returnTime(snapshot
                                                .data[0].cityDetails.sunset),
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: SizeConfig.font17,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              top: SizeConfig.padding16),
                                          child: Text(
                                            "HUMIDITY",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: SizeConfig.font11,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              top: SizeConfig.padding6),
                                          child: Text(
                                            "${snapshot.data[0].weatherList[0].mainWeather.humidity.toString()}%",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: SizeConfig.font17,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              top: SizeConfig.padding16),
                                          child: Text(
                                            "PRESSURE",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: SizeConfig.font11,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              top: SizeConfig.padding6),
                                          child: Text(
                                            "${snapshot.data[0].weatherList[0].mainWeather.humidity.toString()} hPa",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: SizeConfig.font17,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
