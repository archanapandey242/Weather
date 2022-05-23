class WeatherIcon{

  String weatherIcon(String main){
    switch(main) {
      case 'Clouds':
        return "assets/png/icons8-cloud-48.png";
      case 'Clear':
        return "assets/png/icons8-sun-48.png";
      case 'Rain':
        return "assets/png/icons8-rain-48.png";
        break;
    }
  }
}