import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/model/weather.dart';

class WeatherIcon extends StatelessWidget {
  final Weather weather;

  WeatherIcon({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      weather.getIconUrl(),
      height: 64.0,
      width: 64.0,
      placeholderBuilder: (context) => CircularProgressIndicator(),
      color: Colors.pinkAccent,
    );
  }
}
