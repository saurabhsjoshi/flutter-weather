import 'package:flutter/material.dart';

/// Widget to show the location
class Location extends StatelessWidget {
  final String location;

  Location({Key key, @required this.location})
      : assert(location != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      location,
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
