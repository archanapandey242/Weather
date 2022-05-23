class WeatherModel {
  String code;
  List<WeatherList> weatherList;
  CityDetails cityDetails;
  WeatherModel({this.weatherList, this.code, this.cityDetails});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        code: json['cod'],
        weatherList: List<WeatherList>.from(
            json["list"].map((x) => WeatherList.fromJson(x))),
        cityDetails: CityDetails.fromJson(json["city"]));
  }
}

class CityDetails {
  String cityName;
  int sunrise, sunset;
  CityDetails({this.cityName, this.sunrise, this.sunset});
  factory CityDetails.fromJson(Map<String, dynamic> json) {
    return CityDetails(
        cityName: json['name'],
        sunrise: json['sunrise'],
        sunset: json['sunset']);
  }
}

class WeatherList {
  MainWeather mainWeather;
  CloudDetails cloudDetails;
  WindDetails windDetails;
  var dateTime;
  List<WeatherStatus> weatherStatus;
  WeatherList(
      {this.mainWeather,
      this.cloudDetails,
      this.windDetails,
      this.dateTime,
      this.weatherStatus});
  factory WeatherList.fromJson(Map<String, dynamic> json) {
    return WeatherList(
      mainWeather: MainWeather.fromJson(json["main"]),
      cloudDetails: CloudDetails.fromJson(json["clouds"]),
      windDetails: WindDetails.fromJson(json['wind']),
      dateTime: json['dt_txt'],
      weatherStatus: List<WeatherStatus>.from(
          json["weather"].map((x) => WeatherStatus.fromJson(x))),
    );
  }
}

class WeatherStatus {
  String main;
  WeatherStatus({this.main});
  factory WeatherStatus.fromJson(Map<String, dynamic> json) {
    return WeatherStatus(main: json['main']);
  }
}

class MainWeather {
  var temp, feelsLike, maxTemp;
  int pressure, humidity;
  MainWeather(
      {this.feelsLike, this.humidity, this.pressure, this.temp, this.maxTemp});
  factory MainWeather.fromJson(Map<String, dynamic> json) {
    return MainWeather(
        temp: json['temp'],
        feelsLike: json['feels_like'],
        pressure: json['pressure'],
        humidity: json['humidity'],
        maxTemp: json['temp_max']);
  }
}

class CloudDetails {
  int all;
  CloudDetails({this.all});
  factory CloudDetails.fromJson(Map<String, dynamic> json) {
    return CloudDetails(
      all: json['all'],
    );
  }
}

class WindDetails {
  double speed;
  WindDetails({this.speed});
  factory WindDetails.fromJson(Map<String, dynamic> json) {
    return WindDetails(
      speed: json['speed'],
    );
  }
}
