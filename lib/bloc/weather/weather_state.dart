import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather/model/model.dart';

/// Base class for all the weather related states
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

/// Initial empty state.
class WeatherEmpty extends WeatherState {}

/// Loading state.
class WeatherLoading extends WeatherState {}

/// Weather has been fetched.
class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded({@required this.weather}) : assert(weather != null);

  @override
  List<Object> get props => [weather];
}

/// State representing an error while loading the weather.
class WeatherError extends WeatherState {
  final String message;

  const WeatherError(this.message) : assert(message != null);

  @override
  List<Object> get props => [message];
}
