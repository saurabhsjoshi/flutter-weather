import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// Abstract class for all weather related events
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

/// Fetch weather event
class FetchWeather extends WeatherEvent {
  final String city;

  const FetchWeather({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}

class RefreshWeather extends WeatherEvent {
  final String city;

  const RefreshWeather({@required this.city}) : assert(city != null);

  List<Object> get props => [city];
}
