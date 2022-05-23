import 'package:intl/intl.dart';

class DateAndTime{
  static bool returnTodayDate(String dateAndTime){
    var strToDateTime = DateTime.parse(dateAndTime);
    var currentDateTime = DateFormat("dd MMMM yyyy").format(DateTime.now());
    var weatherDate= DateFormat("dd MMMM yyyy");
    String updateDate = weatherDate.format(strToDateTime);
    return currentDateTime == updateDate;

  }

  static String returnTodayDateAndDays(String dateAndTime){
    var strToDateTime = DateTime.parse(dateAndTime);
    var weatherDate= DateFormat("EE, dd MMM");
    String updateDate = weatherDate.format(strToDateTime);
    return updateDate;

  }

  static String returnTime(int timeResponse){
    String time = DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(timeResponse*1000));
    return time;
  }

  static String returnHourlyTime(String dateAndTime){
    var strToDateTime = DateTime.parse(dateAndTime);
    String hourlyTime = DateFormat.j().format(strToDateTime);
    return hourlyTime;
  }
  static bool returnWeeklyDays(String dateAndTime, int noOfDays){
    var strToDateTime = DateTime.parse(dateAndTime);
    var currentDateTime = DateFormat("dd MMMM yyyy").format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day +noOfDays));
    var weatherDate= DateFormat("dd MMMM yyyy");
    String updateDate = weatherDate.format(strToDateTime);
    return currentDateTime == updateDate;

  }


}