import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:weather/AppBlocDelegate.dart';
import 'package:weather/bloc/bloc.dart';
import 'package:weather/screen/home/home.dart';
import 'package:weather/service/service.dart';

import 'repository/repository.dart';

void main() {
  BlocSupervisor.delegate = AppBlocDelegate();
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherService: WeatherService(
      httpClient: http.Client(),
    ),
  );
  runApp(App(
    weatherRepository: weatherRepository,
  ));
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.pinkAccent,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository: weatherRepository),
        child: Home(),
      ),
    );
  }

  App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);
}
