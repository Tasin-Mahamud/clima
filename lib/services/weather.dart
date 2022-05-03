import 'package:clima_project/services/request_location.dart';
import 'package:clima_project/location_screen.dart';
import 'networking.dart';

class WeatherModel {
  String ApiKey = 'c1ab2ac9c2af1f4f49a93333795c5208';
  Request_Location get_current_location = Request_Location();

  Future get_city_weather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$ApiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future get_location_weather() async {
    await get_current_location.getlocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${get_current_location.latitude}&lon=${get_current_location.longitude}&appid=$ApiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
