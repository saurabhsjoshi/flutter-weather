import 'package:meta/meta.dart';
import 'package:weather/model/model.dart';
import 'package:weather/service/service.dart';

/// Repository for weather
class WeatherRepository {
  final WeatherService _weatherService;

  WeatherRepository({@required weatherService})
      : _weatherService = weatherService,
        assert(weatherService != null);

  /// Retrieves the weather for the given [city] name.
  Future<Weather> getWeather(String city) async {
    final int locationId = await _weatherService.getLocationId(city);
    return _weatherService.fetchWeather(locationId);
  }
}
