import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/model/model.dart';
import 'package:weather/repository/repository.dart';

import 'weather.dart';

/// Bloc for weather
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null);

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherLoading();
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoaded(weather: weather);
      } catch (ex) {
        yield WeatherError(ex.toString());
      }
    }
  }
}
