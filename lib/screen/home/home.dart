import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/bloc.dart';
import 'package:weather/model/model.dart';

import 'widget/widget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: getAppBar(context),
      body: getContent(context),
    );
  }

  /// Builds and returns the app bar
  Widget getAppBar(BuildContext context) {
    return AppBar(
      title: Text('Weather'),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _navigateAndDisplayCitySelection(context);
            })
      ],
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
          padding: EdgeInsets.only(top: 50.0),
          child: Center(
            child: Location(location: weather.location),
          ),
        ),
        Center(
          child: LastUpdated(dateTime: weather.lastUpdated),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Temperature(weather: weather),
        ),
      ],
    );
  }

  /// Navigate to the city selection page and wait for result.
  _navigateAndDisplayCitySelection(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => CitySelection()));
    if (result != null) {
      BlocProvider.of<WeatherBloc>(context).add(FetchWeather(city: result));
    }
  }
}
