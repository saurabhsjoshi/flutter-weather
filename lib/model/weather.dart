import 'package:equatable/equatable.dart';

/// Weather condition enum
enum WeatherCondition {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}

/// Weather model
class Weather extends Equatable {
  final String conditionAbbreviation;
  final WeatherCondition condition;
  final String formattedCondition;
  final double minTemp;
  final double temp;
  final double maxTemp;
  final int locationId;
  final String created;
  final DateTime lastUpdated;
  final String location;

  Weather(
      {this.conditionAbbreviation,
      this.formattedCondition,
      this.minTemp,
      this.temp,
      this.maxTemp,
      this.locationId,
      this.created,
      this.lastUpdated,
      this.location})
      : condition = _mapStringToWeatherCondition(conditionAbbreviation);

  /// Build object from JSON
  static Weather fromJson(dynamic json) {
    final consolidatedWeather = json['consolidated_weather'][0];
    return Weather(
      conditionAbbreviation: consolidatedWeather['weather_state_abbr'],
      formattedCondition: consolidatedWeather['weather_state_name'],
      minTemp: consolidatedWeather['min_temp'] as double,
      temp: consolidatedWeather['the_temp'] as double,
      maxTemp: consolidatedWeather['max_temp'] as double,
      locationId: json['woeid'] as int,
      created: consolidatedWeather['created'],
      lastUpdated: DateTime.now(),
      location: json['title'],
    );
  }

  @override
  List<Object> get props => [
        conditionAbbreviation,
        condition,
        formattedCondition,
        minTemp,
        temp,
        maxTemp,
        locationId,
        created,
        lastUpdated,
        location,
      ];

  String getIconUrl() {
    return 'https://www.metaweather.com/static/img/weather/$conditionAbbreviation.svg';
  }

  /// Convert abbreviation to weather condition
  static WeatherCondition _mapStringToWeatherCondition(String input) {
    WeatherCondition state;
    switch (input) {
      case 'sn':
        state = WeatherCondition.snow;
        break;
      case 'sl':
        state = WeatherCondition.sleet;
        break;
      case 'h':
        state = WeatherCondition.hail;
        break;
      case 't':
        state = WeatherCondition.thunderstorm;
        break;
      case 'hr':
        state = WeatherCondition.heavyRain;
        break;
      case 'lr':
        state = WeatherCondition.lightRain;
        break;
      case 's':
        state = WeatherCondition.showers;
        break;
      case 'hc':
        state = WeatherCondition.heavyCloud;
        break;
      case 'lc':
        state = WeatherCondition.lightCloud;
        break;
      case 'c':
        state = WeatherCondition.clear;
        break;
      default:
        state = WeatherCondition.unknown;
    }
    return state;
  }
}
