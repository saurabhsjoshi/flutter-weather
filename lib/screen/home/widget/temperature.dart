import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/screen/home/widget/weather_icon.dart';

class Temperature extends StatelessWidget {
  final Weather weather;

  Temperature({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: WeatherIcon(weather: weather),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: getTemperaturesView(weather),
            )
          ],
        ),
        Center(
          child: Text(
            weather.formattedCondition,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w200, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget getTemperaturesView(Weather weather) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text(
            '${_formattedTemperature(weather.temp)}°',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Column(
          children: [
            Text(
              'max: ${_formattedTemperature(weather.maxTemp)}°',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
            Text(
              'min: ${_formattedTemperature(weather.minTemp)}°',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }

  int _formattedTemperature(double t) => t.round();
}
