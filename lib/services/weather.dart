import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'location.dart';

const apiKey = '6c26423ae2ee11a694c6c8276a370a03';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherData = await networkHelper.geData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location getLoc = Location();
    await getLoc.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(url: '$openWeatherMapUrl?lat=${getLoc.latitude}&lon=${getLoc.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.geData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ';
    } else if (condition < 700) {
      return 'โ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ';
    } else if (condition <= 804) {
      return 'โ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}