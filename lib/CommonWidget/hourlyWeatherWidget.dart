import 'package:flutter/material.dart';
import 'package:weather/CommonWidget/SizeConfig.dart';
import 'package:weather/CommonWidget/dateAndTime.dart';

class HourlyWeatherWidget {
  Widget hourlyWeather(
      BuildContext context, String dateTime, String temp, String weatherIcon) {
    SizeConfig().init(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: SizeConfig.padding12),
          child: Text(
            DateAndTime.returnHourlyTime(dateTime),
            style: TextStyle(color: Colors.white, fontSize: SizeConfig.font11),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: SizeConfig.padding16),
          child: Container(
            height: 80,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white10,
              ),
              color: Colors.white12,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0)),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: SizeConfig.padding8),
              child: Column(
                children: [
                  Image.asset(weatherIcon),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(top: SizeConfig.padding6),
                    child: Text(
                      "${temp + "\u00B0"}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.font11,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget hourlyWeatherLandscape(
      BuildContext context, String dateTime, String temp, String weatherIcon) {
    SizeConfig().init(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: SizeConfig.padding12),
          child: Text(
            DateAndTime.returnHourlyTime(dateTime),
            style: TextStyle(color: Colors.white, fontSize: SizeConfig.font11),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: SizeConfig.padding16),
          child: Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white10,
              ),
              color: Colors.white12,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0)),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: SizeConfig.padding8),
              child: Column(
                children: [
                  Image.asset(weatherIcon),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(top: SizeConfig.padding6),
                    child: Text(
                      "${temp + "\u00B0"}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.font11,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
