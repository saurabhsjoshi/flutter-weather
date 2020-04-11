import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/bloc.dart';
import 'package:weather/model/model.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: getContent(context),
    );
  }

  /// Builds and returns the app bar
  Widget getAppBar(BuildContext context) {
    return AppBar(
      title: Text('Weather'),
    );
  }

  /// Builds the content of the page
  Widget getContent(BuildContext context) {
    return Center(
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherEmpty) {
            return Center(child: Text('Please select a location'));
          }
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is WeatherLoaded) {
            return getWeatherView(state.weather);
          }
          if (state is WeatherError) {
            return Text(state.message, style: TextStyle(color: Colors.red));
          }
          return Container();
        },
      ),
    );
  }

  /// Get the weather view
  Widget getWeatherView(Weather weather) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: Center(
            child: Text(weather.location),
          ),
        ),
        Center(
          child: Text(weather.lastUpdated.toIso8601String()),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0), child: Container()),
      ],
    );
  }
}
