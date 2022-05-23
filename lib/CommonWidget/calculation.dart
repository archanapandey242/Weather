class TemperatureCalculation{
  String convertKelvinToCelsius(var kelvinValue){
    String tempValue = (kelvinValue - 273.15).toInt().round().toString();
    return tempValue;
  }
}