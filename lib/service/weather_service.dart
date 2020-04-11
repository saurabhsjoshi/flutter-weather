import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:weather/model/model.dart';

/// Weather API client.
class WeatherService {
  static const baseUrl = 'https://www.metaweather.com';

  final http.Client httpClient;

  WeatherService({@required this.httpClient}) : assert(httpClient != null);

  /// Retrieves location id with the given [city] name.
  Future<int> getLocationId(String city) async {
    final locationUrl = '$baseUrl/api/location/search/?query=$city';
    final response = await this.httpClient.get(locationUrl);
    if (response.statusCode != 200) {
      throw Exception('Error retrieving locationId for $city');
    }

    final jsonResponse = jsonDecode(response.body) as List;
    return jsonResponse.first['woeid'];
  }

  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = '$baseUrl/api/location/$locationId';
    final response = await this.httpClient.get(weatherUrl);
    if (response.statusCode != 200) {
      throw Exception('Could not retrieve weather for location.');
    }

    final jsonResponse = jsonDecode(response.body);
    return Weather.fromJson(jsonResponse);
  }
}
